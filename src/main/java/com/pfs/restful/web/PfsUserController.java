package com.pfs.restful.web;
import com.pfs.restful.domain.PfsUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pfsusers")
@Controller
@RooWebScaffold(path = "pfsusers", formBackingObject = PfsUser.class)
public class PfsUserController {
}
