/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.model
{
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;

    import mx.collections.ArrayCollection;

    import org.robotlegs.mvcs.Actor;

    import spark.collections.Sort;
    import spark.collections.SortField;

    public class KodyPocztoweModel extends Actor
    {
        [Inject]
        public var addressesUpdatedSignal:AddressesUpdatedSignal;

        private var _addresses:ArrayCollection;

        public function get addresses():ArrayCollection
        {
            return _addresses ||= new ArrayCollection();
        }

        public function set addresses(value:ArrayCollection):void
        {
            _addresses = value;

            var sort:Sort = new Sort();
            sort.compareFunction = sortMiejscowosci;
            _addresses.sort = sort;
            _addresses.refresh();

            addressesUpdatedSignal.dispatch(addresses);
        }

        private static function sortMiejscowosci(a:Object, b:Object, fields:Array = null):int
        {
            return sortComparePL(String(a.miej), String(b.miej));
        }

        private static function sortComparePL(obj1:String, obj2:String, caseSensitive:Boolean = false):int
        {
            if (obj1 == null && obj2 == null) return 0;
            else if (obj1 == null) return -1;
            else if (obj2 == null) return 1;

            var order:String;
            if (caseSensitive) order = "0123456789AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOo ÓóPpQqRrSsŚśTtUuVvWwXxYyZzŹźŻż";
            else order = "0123456789aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż";

            var minLen:int;
            var posA:int;
            var posB:int;
            if (!isNaN(Number(obj1)) && !isNaN(Number(obj2)))
            {
                if (Number(obj1) < Number(obj2)) return -1;
                else if (Number(obj1) > Number(obj2)) return 1;
                else return 0;
            }
            else
            {
                minLen = obj1.length < obj2.length ? obj1.length : obj2.length;
                var i:int = 0;
                for (; i < minLen; i++)
                {
                    if (caseSensitive) posA = order.indexOf(obj1.slice(i, i + 1));
                    else posA = order.indexOf(obj1.slice(i, i + 1).toLowerCase());
                    if (caseSensitive) posB = order.indexOf(obj2.slice(i, i + 1));
                    else posB = order.indexOf(obj2.slice(i, i + 1).toLowerCase());
                    if (posA < posB) return -1;
                    else if (posA > posB) return 1;
                }

                if (obj1.length < obj2.length) return -1;
                else if (obj1.length > obj2.length) return 1;
                else return 0;
            }
        }
    }
}
