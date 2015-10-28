package com.pfs.restful.web;
import com.pfs.restful.domain.Merchandise;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/merchandises")
@Controller
@RooWebScaffold(path = "merchandises", formBackingObject = Merchandise.class)
public class MerchandiseController {
}
