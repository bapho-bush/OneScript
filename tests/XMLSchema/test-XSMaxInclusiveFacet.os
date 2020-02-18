Перем ЮнитТест;

#Область ОбработчикиСобытийМодуля

Функция ПолучитьСписокТестов(МенеджерТестирования) Экспорт
	
	ЮнитТест = МенеджерТестирования;

	СписокТестов = Новый Массив;
	СписокТестов.Добавить("ТестКонструктор");
	СписокТестов.Добавить("TestConstructor");
	СписокТестов.Добавить("ТестЗначение");
	СписокТестов.Добавить("ТестЛексическоеЗначение");
	СписокТестов.Добавить("ТестОпределениеПростогоТипа");

	Возврат СписокТестов;

КонецФункции

#КонецОбласти

#Область ОбработчикиТестирования

Процедура ТестКонструктор() Экспорт
	
	Фасет = Новый ФасетМаксимальногоВключающегоЗначенияXS;
	
	ЮнитТест.ПроверитьРавенство(ТипЗнч(Фасет), Тип("ФасетМаксимальногоВключающегоЗначенияXS"));
	ЮнитТест.ПроверитьРавенство(Фасет.ТипКомпоненты, ТипКомпонентыXS.МаксимальноВключающийФасет);
	ЮнитТест.ПроверитьИстину(Фасет.Включающий);
	ЮнитТест.ПроверитьЛожь(Фасет.Исключающий);

КонецПроцедуры

Процедура TestConstructor() Экспорт

	Facet = New XSMaxInclusiveFacet;
	
	ЮнитТест.ПроверитьРавенство(ТипЗнч(Facet), Тип("XSMaxInclusiveFacet"));
	ЮнитТест.ПроверитьРавенство(Facet.ComponentType, XSComponentType.MaxInclusiveFacet);

КонецПроцедуры

Процедура ТестЗначение() Экспорт

	Фасет = Новый ФасетМаксимальногоВключающегоЗначенияXS;
	Фасет.Значение = "5";

	ЮнитТест.ПроверитьРавенство(Фасет.Значение, "5");
	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, "5");

	Фасет.Значение = Истина;

	ЮнитТест.ПроверитьРавенство(Фасет.Значение, Истина);
	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, "true");

	Фасет.Значение = Ложь;

	ЮнитТест.ПроверитьРавенство(Фасет.Значение, Ложь);
	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, "false");

	Фасет.Значение = 5;

	ЮнитТест.ПроверитьРавенство(Фасет.Значение, 5);
	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, "5");

	Дата = ТекущаяДата();
	
	Фасет.Значение = Дата;
	ЮнитТест.ПроверитьРавенство(Фасет.Значение, Дата);
	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, XMLСтрока(Дата));

КонецПроцедуры

Процедура ТестЛексическоеЗначение() Экспорт

	Фасет = Новый ФасетМаксимальногоВключающегоЗначенияXS;
	Фасет.ЛексическоеЗначение = "5";

	ЮнитТест.ПроверитьРавенство(Фасет.ЛексическоеЗначение, "5");
	ЮнитТест.ПроверитьРавенство(Фасет.Значение, "5");

КонецПроцедуры

Процедура ТестОпределениеПростогоТипа() Экспорт

	Фасет = Новый ФасетМаксимальногоВключающегоЗначенияXS;
	Фасет.ЛексическоеЗначение = "5";

	ОпределениеТипа = Новый ОпределениеПростогоТипаXS;
	ОпределениеТипа.Вариант = ВариантПростогоТипаXS.Атомарная;
	ОпределениеТипа.Фасеты.Добавить(Фасет);

	ЮнитТест.ПроверитьРавенство(Фасет.Контейнер, ОпределениеТипа);
	ЮнитТест.ПроверитьРавенство(Фасет.ОпределениеПростогоТипа, ОпределениеТипа);

КонецПроцедуры

#КонецОбласти