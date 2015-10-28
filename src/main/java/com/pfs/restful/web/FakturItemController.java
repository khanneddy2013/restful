package com.pfs.restful.web;
import com.pfs.restful.domain.FakturItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/fakturitems")
@Controller
@RooWebScaffold(path = "fakturitems", formBackingObject = FakturItem.class)
public class FakturItemController {
}
