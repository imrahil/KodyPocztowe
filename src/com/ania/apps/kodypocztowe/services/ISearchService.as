/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.services
{
    import com.ania.apps.kodypocztowe.model.vo.SearchAreaVO;

    public interface ISearchService
    {
        function searchZipCode(searchAreaVO:SearchAreaVO):void;
        function showAddress(zipCode:String):void;
    }
}
