package com.easybuy.web.controller;

import com.easybuy.pojo.*;
import com.easybuy.service.*;
import com.mysql.cj.xdevapi.Session;
import jdk.nashorn.internal.ir.IfNode;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.xml.soap.Detail;
import javax.xml.ws.RequestWrapper;
import java.util.ArrayList;
import java.util.Date;
import java.util.IdentityHashMap;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/8
 * version: 1.0
 */
@Controller
@Transactional(propagation = Propagation.REQUIRED)
public class BuyController {

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @Autowired
    ShoppingService shoppingService;

    @Autowired
    NewsService newsService;

    @Autowired
    UserAddressService userAddressService;

    @Autowired
    OrderService orderService;

    @Autowired
    ProductCategoryService productCategoryService;

    @Autowired
    UserCollectionService userCollectionService;

    @RequestMapping("Index.do")
    public String index(HttpSession session) {
        List<News> news = newsService.getNews();
        List<News> list = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            list.add(news.get(i));
        }
        session.setAttribute("news", list);
        List<ProductCategory> levelOne = productCategoryService.getLevelOne();
        List<ProductCategory> levelTwo = productCategoryService.getLevelTwo();
        List<ProductCategory> levelThree = productCategoryService.getLevelThree();
        session.setAttribute("levelOne", levelOne);
        session.setAttribute("levelTwo", levelTwo);
        session.setAttribute("levelThree", levelThree);
        return "pages/Index";
    }

    @RequestMapping("TestLogin.do")
    public String testLogin() {
        return "pages/Login";
    }

    @RequestMapping(value = "Login.do", method = RequestMethod.POST)
    public String login(Model model, HttpSession session, @RequestParam("loginName") String loginName, @RequestParam("password") String password) {
        User user = userService.login(loginName, password);
        if (user == null) {
            model.addAttribute("msg", "密码错误！请重新输入！");
            return "pages/Login";
        }
        session.setAttribute("user", user);
        Integer count = userService.findShoppingCountByUser(user);
        session.setAttribute("shoppingCount", count);
        Double totalPrice = shoppingService.findTotalPriceByUser(user);
        session.setAttribute("totalPrice", totalPrice);
        return "redirect:Index.do";
    }

    @RequestMapping("TestRegister.do")
    public String testRegister() {
        return "pages/Regist";
    }

    @RequestMapping(value = "Register.do", method = RequestMethod.POST)
    public String register(User user, HttpSession session) {
        userService.registerUser(user);
        User userByName = userService.findUserByName(user.getLoginName());
        session.setAttribute("user", user);
        return "pages/Index";
    }

    @RequestMapping(value = "findUser.do", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String finsUser(String loginName) {
        User user = userService.findUserByName(loginName);
        if (user == null) {
            return "false";
        }
        return "true";
    }

    @RequestMapping("showBuyCar.do")
    public String showBuyCar(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "pages/Login";
        }
        List<Shopping> list = shoppingService.findShoppingByUser(user);
        Integer count = shoppingService.findCountByUser(user);
        model.addAttribute("count", count);
        model.addAttribute("list", list);
        Double totalPrice = shoppingService.findTotalPriceByUser(user);
        model.addAttribute("totalPrice", totalPrice);
        return "pages/BuyCar";
    }

    @RequestMapping("getCars.do")
    @ResponseBody
    public List<Shopping> getCars(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return null;
        }
        List<Shopping> list = shoppingService.findShoppingByUser(user);
        return list;
    }

    @RequestMapping("buyCarTwo.do")
    public String buyCarTwo(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "pages/Login";
        }
        List<Shopping> list = shoppingService.findShoppingByUser(user);
        model.addAttribute("list", list);
        Double totalPrice = shoppingService.findTotalPriceByUser(user);
        model.addAttribute("totalPrice", totalPrice);
        UserAddress address = userAddressService.getAddress(user);
        model.addAttribute("address", address);
        return "pages/BuyCar_Two";
    }

    @RequestMapping(value = "changeProductNum.do", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String changeProductNum(Integer newNum, Integer productId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String s = shoppingService.changeProductNum(user.getId(), productId, newNum);
        Double totalPrice = shoppingService.findTotalPriceByUser(user);
        session.setAttribute("totalPrice", totalPrice);
        return s;
    }

    @RequestMapping("deleteShopping.do")
    public String deleteShopping(@RequestParam("id") Integer id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "pages/Login";
        }
        shoppingService.deleteShopping(user.getId(), id);
        Double totalPrice = shoppingService.findTotalPriceByUser(user);
        session.setAttribute("totalPrice", totalPrice);
        return "pages/BuyCar";
    }

    @RequestMapping(value = "search.do", method = RequestMethod.GET)
    public String search(Integer pageNum, String name, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "pages/Login";
        }
        List<UserCollection> collection = userCollectionService.findCollectionByUserId(user.getId());
        session.setAttribute("collection", collection);
        Page page = productService.searchByName(name, pageNum);
        model.addAttribute("page", page);
        model.addAttribute("name", name);
        return "pages/CategoryList";
    }

    @RequestMapping("changeAddress.do")
    public String changeAddress(@RequestParam("id") Integer id, Model model) {
        UserAddress address = userAddressService.findAddressById(id);
        model.addAttribute("address", address);
        return "pages/Member_Address";
    }

    @RequestMapping("setDefaultAddress.do")
    @ResponseBody
    public String setDefaultAddress(Integer id) {
        UserAddress address = userAddressService.findAddressById(id);
        address.setIsDefault(1);
        userAddressService.updateAddress(address);
        return "修改成功！";
    }

    @RequestMapping("buyCar_Three.do")
    public String buyCar_Three(HttpSession session,
                               @RequestParam("payType") Integer payType,
                               @RequestParam("expressType") Integer expressType,
                               @RequestParam("cost") Double cost,
                               Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "pages/Login";
        }

        List<Shopping> list = shoppingService.findShoppingByUser(user);
        Order order = new Order();
        if (payType == 1) {
            Double balance = userService.getUserBalance(user);
            if (balance < cost) {
                order.setPayType(5);
                model.addAttribute("order", order);
                return "pages/BuyCar_Three";
            }
        }
        order.setPayType(payType);
        order.setExpressType(expressType);
        order.setUser(user);
        order.setCost(cost);
        order.setCreateTime(new Date());
        order.setSerialNumber(System.currentTimeMillis() + "" + user.getId());
        UserAddress address = userAddressService.getAddress(user);
        order.setUserAddress(address);
        Integer orderId = orderService.createOrder(order);
        order.setId(orderId);
        System.out.println("orderId" + orderId);
        orderService.saveDetails(list, order);

        shoppingService.deleteShoppingByUser(user);

        model.addAttribute("order", order);
        return "pages/BuyCar_Three";
    }

    @RequestMapping("TestMember.do")
    public String testMember() {
        return "pages/Member";
    }

    @RequestMapping("showNews.do")
    public String showNews(@RequestParam("id") Integer newsId, Model model) {
        News news = newsService.findNewsById(newsId);
        model.addAttribute("news", news);
        return "pages/news";
    }

    @RequestMapping("allNews.do")
    public String allNews(Model model, @RequestParam("pageNum") Integer pageNum) {
        List<News> news = newsService.getNewsByPage(pageNum);
        int size = newsService.getNews().size();
        Page page = new Page();
        page.setList(news);
        page.setPageNum(pageNum);
        page.setTotalCount(size);
        page.setTotalPage(size % 10 == 0 ? size / 10 : size / 10 + 1);
        model.addAttribute("page", page);
        return "pages/allNews";
    }

    @RequestMapping("searchByCategory.do")
    public String searchByCategory(HttpSession session, Model model, @RequestParam("id") Integer categoryId, @RequestParam("pageNum") Integer pageNum) {
        User user = (User) session.getAttribute("user");
        if (pageNum == null) {
            pageNum = 1;
        }
        Page page = productService.searchByCategory(categoryId, pageNum);
        ProductCategory byId3 = productCategoryService.findById(categoryId);
        ProductCategory byId2 = productCategoryService.findById(byId3.getParentId());
        ProductCategory byId1 = productCategoryService.findById(byId2.getParentId());
        List<UserCollection> collection = userCollectionService.findCollectionByUserId(user.getId());
        session.setAttribute("collection", collection);
        model.addAttribute("page", page);
        model.addAttribute("category3", byId3);
        model.addAttribute("category2", byId2);
        model.addAttribute("category1", byId1);
        return "pages/CategoryList";
    }

    @RequestMapping(value = "deleteAllCollection.do" , produces = "text/html;charset=UTF-8" )
    @ResponseBody
    public String deleteAllCollection(Integer userId) {
        userCollectionService.deleteCollectionByUser(userId);
        return "删除成功!";
    }

    @RequestMapping("showProduct.do")
    public String showProduct(@RequestParam("id") Integer id , Model model){
        Product product = productService.findProductById(id);
        model.addAttribute("product" , product);
        return "pages/Product" ;
    }
    @RequestMapping("addShopping.do")
    @ResponseBody
    public String addShopping(Integer num , Integer productId , HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "pages/Login";
        }
        Product product = productService.findProductById(productId);
        return shoppingService.addShopping(user, product, num);

    }

    @RequestMapping("addCollection.do")
    @ResponseBody
    public String addCollection(Integer productId   , HttpSession session){
        Product product = productService.findProductById(productId);
        User user = (User) session.getAttribute("user");
        UserCollection collection = new UserCollection();
        collection.setProduct(product);
        collection.setUserId(user.getId());
        return userCollectionService.addCollection(collection);
    }
}
