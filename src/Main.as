package 
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.TriangleCulling;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import flash.filesystem.*;
	import flash.events.Event;

	/**
	 * ...
	 * @author Olexandr Grynivskyi
	 */
	public class Main extends Sprite 
	{
		//створюємо змінні класів ролика
		private var scena: Scena_design;
		
		//транспорт
		private var cars: Cars_design;
		private var cars2: Cars2_design;
		private var gaz: Gaz_design;
		private var moto: Moto_design;
		private var tractor: Tractor_design;
		
		
		//запитання
		private var vopros1: Vopros1_design;
		private var b1_1: b1_1_design;
		private var b1_2: b1_2_design;
		
		private var vopros2: Vopros2_design;
		private var b2_1: b2_1_design;
		private var b2_2: b2_2_design;
		
		private var vopros3: Vopros3_design;
		private var b3_1: b3_1_design;
		//private var b3_2: b3_2_design;
		
		private var vopros4: Vopros4_design;
		private var b4_1: b4_1_design;
		private var b4_2: b4_2_design;
		private var b4_3: b4_3_design;
		
		private var vopros5: Vopros5_design;
		
		private var vopros6: Vopros6_design;
		private var b6_1: b6_1_design;
		private var b6_2: b6_2_design;
		
		private var vopros7: Vopros7_design;
							
		//зміна для аварії
		private var avaria: avaria_design;
		
		
		//Змінна для вітання
		private var pozd: Pozd_design;
		
		//текст для завершення завдання
		private var textForm: MovieClip = new MovieClip();
		private var text: TextField = new TextField();
	
		//Стрілочки
		private var st: St_design;
		private var st_left: St_left_design;
		private var st_right: St_right_design;
		private var st_right1: St_right1_design;
		private var st_right_down: St_right_down_design;
		private var st_left_down: St_left_down_design;
				
		//змінні для повороту машини
		private var speed: Number = 2;
		private var grad: Number=-90;
		private var rad: Number =0;
		private var speedX: Number;
		private var speedY: Number;
		private var gradRot: Number = -1.3;
		
		
		//змінні для повороту gaz
		private var speed1: Number = 2;
		private var grad1: Number=0;
		private var rad1: Number =0;
		private var speedX1: Number;
		private var speedY1: Number;
		private var gradRot1: Number = -0.8;
		
		
		//змінні для повороту moto
		private var speed2: Number = 2;
		private var grad2: Number=-90;
		private var rad2: Number =0;
		private var speedX2: Number;
		private var speedY2: Number;
		private var gradRot2: Number = -2;
		
		
		//змінні для повороту машини карт 37
		private var speed3: Number = 2;
		private var grad3: Number=-90;
		private var rad3: Number =0;
		private var speedX3: Number;
		private var speedY3: Number;
		private var gradRot3: Number = 4;
		
		//змінні для повороту машини на право після карти 37
		private var speed4: Number = 2;
		private var grad4: Number=0;
		private var rad4: Number =0;
		private var speedX4: Number;
		private var speedY4: Number;
		private var gradRot4: Number =1;
		
		//змінні для повороту машини на кільцевій ч1
		private var speed5: Number = 3;
		private var grad5: Number=-90;
		private var rad5: Number =0;
		private var speedX5: Number;
		private var speedY5: Number;
		private var gradRot5: Number = -1;
		
		//змінні для повороту машини на кільцевій ч2
		private var speed6: Number = 2;
		private var grad6: Number=180;
		private var rad6: Number =0;
		private var speedX6: Number;
		private var speedY6: Number;
		private var gradRot6: Number =-0.7;
		
		
		//reset
		private var reset:Reset_design;	
		private var file:File;
		private var fileStream:FileStream;
		import flash.filesystem.*;
		import flash.events.Event;
		
		//task
		//private var task1:Boolean;
		
				
	public function Main():void 
	{
		
			file = new File(File.applicationDirectory.nativePath);
			//file = file.resolvePath(file.parent.url+"/test.txt");
			file = file.resolvePath("otvet.txt");
			fileStream = new FileStream();
			
			//добро пожаловать
			fileStream.openAsync(file, FileMode.WRITE);
			
			fileStream.writeUTFBytes("Добро пожаловать !" + "\n"+"\n");
				
			fileStream.addEventListener(Event.CLOSE, fileClosed);
			fileStream.close();

			function fileClosed(event:Event):void {
			trace("closed");
			}
			
			
	
		
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//сцена
			scena = new Scena_design();
			addChild(scena);
			scena.x = -500;
			scena.y = -100;
			scena.cacheAsBitmap = true;
			
			//Червона машина
			cars = new Cars_design();
			cars.x = 475;
			cars.y = 520; 
			cars.rotation = -90;
			addChild(cars);
			cars.cacheAsBitmap = true;
			
			//Синя машина
			gaz = new Gaz_design();
			gaz.rotation = 0;
			gaz.x = 80;
			gaz.y = 300;
			addChild(gaz);	
			gaz.cacheAsBitmap = true;
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
			//функція для запису у файл
			private function onFileWrite(qu:String, flag:Boolean):void 
			{
						fileStream.openAsync(file, FileMode.APPEND);
						
						if(flag)
						fileStream.writeUTFBytes(qu + "," + " правильно" + "\n");
						else
						fileStream.writeUTFBytes(qu + "," + " неправильно" + "\n");
																	
						fileStream.addEventListener(Event.CLOSE, fileClosed);
						fileStream.close();

						function fileClosed(event:Event):void {
						trace("closed");
						}
			}			
		
		
		//ресет загальний, перехід до першої сцени
		private function Reset(e:Event):void 
		{
			/*if (!task1)
			{
				if (stage) init();
				else 
				while (numChildren > 0)
				{
					removeChildAt(0);
					addEventListener(Event.ADDED_TO_STAGE, init);
				}	
			}
			*/
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
								
					addChild(scena);
					scena.x = -500;
					scena.y = -100;

					cars.x = 475;
					cars.y = 520; 
					cars.rotation = -90;
					addChild(cars);
					
					gaz.x = 80;
					gaz.y = 300;
					gaz.rotation = 0;
					addChild(gaz);	
		}
		
			
		
		/******************************************
		 *Перший вибір стрілочками вверх або вліво*
		 ******************************************/
		
		private function onEnterFrame(e:Event):void
		{
			cars.y -=2;
			gaz.x +=2;
			//trace(cars.x);
						
			if (cars.y == 480)
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				
				//прямо
				st = new St_design();
				st.x = 480;
				st.y = 380;
				addChild(st);
				st.buttonMode = true;
				st.addEventListener(MouseEvent.CLICK, goSt);
				
				function goSt(e:MouseEvent):void
					{
						stage.addEventListener(Event.ENTER_FRAME, onEnterFrame1);
						removeChild(st);
						removeChild(st_left);
					}
					
					
				//вліво
				st_left = new St_left_design();
				st_left.x = 440;
				st_left.y = 380;
				st_left.buttonMode = true;
				addChild(st_left);
				st_left.addEventListener(MouseEvent.CLICK, goSt_left);
				
				function goSt_left(e:MouseEvent):void
					{
						stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left);
						removeChild(st);
						removeChild(st_left);
					}	
				
			}
			
		}	
		
		/*********************************************************************
		 *Виконується , якщо ми натиснули стрілoчку вверх (Перше запитанння)* 
		 *********************************************************************/
		private function onEnterFrame1(e:Event):void 
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame1);
								
			vopros1 = new Vopros1_design();
			vopros1.x = 400;
			vopros1.y = 600;
			addChild(vopros1);
				
			b1_1 = new b1_1_design();
			b1_1.x = 270;
			b1_1.y = 575;
			addChild(b1_1);
				
			b1_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up);
					removeChild(vopros1);
					removeChild(b1_1);
					removeChild(b1_2);
				
					onFileWrite("Водитель какого автомобиля должен уступить дорогу?", true);
					/*task1 = true;*/
					
				} 
					
			b1_2 = new b1_2_design();
			b1_2.x = 500;
			b1_2.y = 575;
			addChild(b1_2);				
			b1_2.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up);
					removeChild(vopros1);
					removeChild(b1_1);
					removeChild(b1_2);
					
					onFileWrite("Водитель какого автомобиля должен уступить дорогу?", false);
				} 
		}
		
		
		//Якщо натиснули легковий - вірне , то
		private function onEnterFrameOtvet1Up(e:Event):void 
		{
			gaz.x += 4;
			//trace(gaz.x);
			
			if (gaz.x == 664) 
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up);
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up1);
				
			}	
			
		}
				
		//Якщо натиснули вантажний - не вірне , то аварія
		function onEnterFrameOtvet2Up(e:Event):void 
		{
			cars.y -=3;
			gaz.x += 4;
			//trace(cars.y);
			
			if (cars.y == 315) 
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up);
				avaria = new avaria_design();
				avaria.x = 400;
				avaria.y = 300;
				addChild(avaria);
								
				textForm.graphics.lineStyle(2, 0x1A171B);
				textForm.graphics.beginFill(0xFFFF99);
				textForm.graphics.drawRect(0, 0, 300,350);
				textForm.graphics.endFill();
				textForm.x = 230;
				textForm.y = 550;
				addChild(textForm);
				
				textForm.addChild(text);
				text.autoSize = "left";
				text.text = String("Вы нарушили правило......!");
				
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset);
			addChild(reset);			
			}
			
		}
		
		
		/**************************************************
		*Продовжуємо їхати вверх. Сцена 2 трактор і машина* 
		***************************************************/
		private function onEnterFrameOtvet1Up1(e:Event):void 
		{
			cars.y -= 0.5;
			//trace(cars.y);
			gaz.y += 4;
			gaz.x += 4;
			scena.y += 4;
			
			if (cars.y == 431)
			{
				removeChild(gaz);				
			}
			
			if (cars.y == 391) 
			{
				tractor = new Tractor_design();
				addChild(tractor);
				tractor.x = 390;
				tractor.y = 0;
							
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up1);
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up2);
			}
		}
		
		//Запитання Сцена 2
		function onEnterFrameOtvet1Up2(e:Event):void 
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up2);
			
			/*trace(scena.x+" трайс сцена х");
			trace(scena.y + " трайс сцена у");
			
			trace(cars.x+" трайс машина х");
			trace(cars.y + " трайс машина у");
			
			trace(tractor.x+" трайс tractor х");
			trace(tractor.y + " трайс tractor у")*/;
			
			
			vopros2 = new Vopros2_design();
			vopros2.x = 400;
			vopros2.y = 600;
			addChild(vopros2);
				
			b2_1 = new b2_1_design();
			b2_1.x = 270;
			b2_1.y = 585;
			addChild(b2_1);
				
			b2_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up11);
					removeChild(vopros2);
					removeChild(b2_1);
					removeChild(b2_2);
					
					onFileWrite("Водитель какого транспортного средства должен уступить дорогу?", false);
				} 
					
			b2_2 = new b2_2_design();
			b2_2.x = 520;
			b2_2.y = 585;
			addChild(b2_2);				
			b2_2.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up12);
					removeChild(vopros2);
					removeChild(b2_1);
					removeChild(b2_2);
					
					onFileWrite("Водитель какого транспортного средства должен уступить дорогу?", true);
				} 
		}
			
		//Якщо трактор - неправельно - аварія 
		function onEnterFrameOtvet1Up11(e:Event):void 
		{
			cars.y -= 3;
			tractor.y +=3;
			//trace(cars.y);
			if (cars.y == 250)
			{	
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up11);
				avaria = new avaria_design();
				avaria.x = 400;
				avaria.y = 300;
				addChild(avaria);
									
				textForm.graphics.lineStyle(2, 0x1A171B);
				textForm.graphics.beginFill(0xFFFF99);
				textForm.graphics.drawRect(0, 0, 300,350);
				textForm.graphics.endFill();
				textForm.x = 210;
				textForm.y = 550;
				addChild(textForm);
					
				textForm.addChild(text);
				text.autoSize = "left";
				text.text = String("Вы нарушили правило......!");
				
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset1);
			addChild(reset);
			
			}
		}
		
		//ресет для сцени машина і трактор	
		function Reset1(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);
					
				}
				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet1Up2);
					
					addChild(scena);
					scena.x = -500;
					scena.y = 612;
					
					addChild(cars);
					cars.x = 475;
					cars.y = 391;
					
					addChild(tractor);
					tractor.x = 390;
					tractor.y = 0;
		}	
			
		//якщо легкового - правельно - їде трактор
		function onEnterFrameOtvet2Up12(e:Event):void 
		{
			tractor.y += 3;
			//trace(cars.y);
			
			if (tractor.y > 327)
			{
				cars.y -=3; 
				//trace(tractor.y);
				
				if (tractor.y == 618)
				{
					removeChild(tractor);
					stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up12);
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up13);
				}
			}
		}
	
		
	
	/************************************************************
	*Продовжуємо їхати вверх. Сцена 4 машина і три напрямки руху* 
	*************************************************************/
	function onEnterFrameOtvet2Up13(e:Event):void 
	{
		cars.y += 2;
		//trace(cars.y);
		scena.y += 4;
		if (cars.y == 550)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up13);	
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up14);
		}
		
	}
	
	//Вибір напрямку куди їхати(вліво, прямо, направо)
	function onEnterFrameOtvet2Up14(e:Event):void 
	{	
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up14);
		//прямо
		st = new St_design();
		st.x = 470;
		st.y = 420;
		st.buttonMode = true;
		addChild(st);
		st.addEventListener(MouseEvent.CLICK, otvet1Up);
		function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up16);
					removeChild(st);
					removeChild(st_left);
					removeChild(st_right);
				} 
						
		//вліво
		st_left = new St_left_design();
		st_left.x = 440;
		st_left.y = 460;
		st_left.buttonMode = true;
		addChild(st_left);
		st_left.addEventListener(MouseEvent.CLICK, otvet2Up);
		function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15);
					removeChild(st);
					removeChild(st_left);
					removeChild(st_right);
				} 
				
		//вправо	
		st_right = new St_right_design();
		st_right.x = 500;
		st_right.y = 460;
		st_right.buttonMode = true;
		addChild(st_right);
		st_right.addEventListener(MouseEvent.CLICK, otvet3Up);
		function otvet3Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17);
					removeChild(st);
					removeChild(st_left);
					removeChild(st_right);
				}
	}
	
	
	
	/***********************************
	*** карточка 37, натиснули прямо ***
	***********************************/ 
	function onEnterFrameOtvet2Up16(e:Event):void  
	{
		cars.y -= 2;
		//trace(cars.y);
		
		
		if (cars.y == 200)
		{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up16);
		
		//trace(scena.y);
		
		
		st = new St_design();
		st.x = 470;
		st.y = 100;
		addChild(st);
		
		st_right = new St_right_design();
		st_right.x = 500;
		st_right.y = 70;
		addChild(st_right);
			
		vopros4 = new Vopros4_design();
		vopros4.x = 400;
		vopros4.y = 600;
		addChild(vopros4);
		
		b4_1 = new b4_1_design();
		b4_1.x = 270;
		b4_1.y = 575;
		addChild(b4_1);		
		b4_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
		function otvet1Up(e:MouseEvent):void
			{
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet37UpNo);
				removeChild(st);
				removeChild(st_right);
				removeChild(vopros4);
				removeChild(b4_1);
				removeChild(b4_3);
				
				onFileWrite("Может ли легковой автомобиль двигатся в одном из направлений?", true);
			} 
			
		b4_3 = new b4_3_design();
		b4_3.x = 500;
		b4_3.y = 575;
		addChild(b4_3);				
		b4_3.addEventListener(MouseEvent.CLICK, otvet3Up);
			
		function otvet3Up(e:MouseEvent):void
			{
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet37UpYes);
				removeChild(st);
				removeChild(st_right);
				removeChild(vopros4);
				removeChild(b4_1);
				removeChild(b4_3);
				
				onFileWrite("Может ли легковой автомобиль двигатся в одном из направлений?", false);
			}			
			
		}
	}
	
	//карточка 37, успішно завершили завдання
	function onEnterFrameOtvet37UpNo(e:Event):void
	{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet37UpNo);
			
					pozd = new Pozd_design();
					pozd.x = 400;
					pozd.y = 300;
					addChild(pozd);	
			/*textForm.graphics.lineStyle(2, 0x1A171B);
			textForm.graphics.beginFill(0x99FF00);
			textForm.graphics.drawRect(0, 0, 300,120);
			textForm.graphics.endFill();
			textForm.x = 250;
			textForm.y = 300;
			addChild(textForm);
							
			textForm.addChild(text);
			text.autoSize = "left";
			text.text = String("Поздравляем! Вы успешно завершили задание!");*/
			
			/*reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset);
			addChild(reset);*/	
	}
	
	//неправельна відповідь на запитання карт 37
	function onEnterFrameOtvet37UpYes(e:Event):void
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet37UpYes);
		
		avaria = new avaria_design();
		avaria.x = 400;
		avaria.y = 300;
		addChild(avaria);
		
		textForm.graphics.lineStyle(2, 0x1A171B);
		textForm.graphics.beginFill(0xFFFF99);
		textForm.graphics.drawRect(0, 0, 300,350);
		textForm.graphics.endFill();
		textForm.x = 210;
		textForm.y = 550;
		addChild(textForm);
			
		textForm.addChild(text);
		text.autoSize = "left";
		text.text = String("Вы нарушили правило......!");
		
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset3);
			addChild(reset);
			
	}
		//ресет для карточки 37 прямо
		function Reset3(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up16);
					
					addChild(scena);
					scena.x = -500;
					scena.y = 1512;
					
					addChild(cars);
					cars.x = 475;
					cars.y = 202;
		}	

	
	
	
	/**********************************
	***карточка 37, натиснули вліво **
	**********************************/
	function onEnterFrameOtvet2Up15(e:Event):void  
	{
		cars.y -= 2;
		//trace(cars.y);
		if (cars.y == 400)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_1);
		}
	}
	//повертаємо вліво після вибору на карт 37
	function onEnterFrameOtvet2Up15_1(e:Event):void 
	{
		if (cars.rotation > 0) 
				{
					grad = -180;
				}
				else
				{
					grad += gradRot;
						
					rad = (grad* Math.PI)/180;
					speedX = speed*Math.cos(rad);
					speedY = speed*Math.sin(rad);
						
					cars.rotation = grad;
					cars.x += speedX;
					cars.y += speedY;					
				}	
		scena.x += 4;
		cars.x += 1;
		//trace(cars.x);	
		if (cars.x == 685.75) 
		{
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_2);
		}
	}
	//повертаємо на кільцеву
	function onEnterFrameOtvet2Up15_2(e:Event):void 
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_1);
		
		if (cars.rotation <= -180) 
				{
					grad5 = 0;
				}
				else
				{
					grad5 += gradRot5;
						
					rad5 = (grad5* Math.PI)/180;
					speedX5 = speed5*Math.cos(rad5);
					speedY5 = speed5*Math.sin(rad5);
						
					cars.rotation = grad5;
					cars.x += speedX5;
					cars.y += speedY5;	
					
					//trace (cars.x);
					if (cars.x == 511.2) 
					{
						stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3);	
					}
					
				}
	}
	
	//проїдемо 2 кадри машиною і задаємо запитання
	function onEnterFrameOtvet2Up15_3(e:Event):void 
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_2);
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3);
		
			cars2 = new Cars2_design();
			cars2.x = 340;
			cars2.y = 30; 
			cars2.rotation = 90;
			addChild(cars2);
		
			st_left_down = new St_left_down_design();
			st_left_down.x = 410;
			st_left_down.y = 160;
			addChild(st_left_down);
			
			st = new St_design();
			st.x = 340;
			st.y = 120;
			st.rotation =180;
			addChild(st);
			
			vopros6 = new Vopros6_design();
			vopros6.x = 400;
			vopros6.y = 600;
			addChild(vopros6);
				
			b6_1 = new b6_1_design();
			b6_1.x = 270;
			b6_1.y = 585;
			addChild(b6_1);
			b6_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3NO);
					removeChild(vopros6);
					removeChild(b6_1);
					removeChild(b6_2);
					removeChild(st);
					removeChild(st_left_down);
					
					onFileWrite("Какой автомобиль должен уступить дорогу?", false);
				} 
					
			b6_2 = new b6_2_design();
			b6_2.x = 500;
			b6_2.y = 585;
			addChild(b6_2);				
			b6_2.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3YES);
					removeChild(vopros6);
					removeChild(b6_1);
					removeChild(b6_2);
					removeChild(st);
					removeChild(st_left_down);
					
					onFileWrite("Какой автомобиль должен уступить дорогу?", true);
				} 
			
	}
	
	//Відповідь синя - не вірно - аварія
	function onEnterFrameOtvet2Up15_3NO(e:Event):void 
	{
		cars.x -= 2;
		cars2.y += 2;
		//trace(cars2.y);
		
		if (cars2.y == 130) {
			
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3NO);
			
			avaria = new avaria_design();
			avaria.x = 400;
			avaria.y = 300;
			addChild(avaria);
										
			textForm.graphics.lineStyle(2, 0x1A171B);
			textForm.graphics.beginFill(0xFFFF99);
			textForm.graphics.drawRect(0, 0, 300,350);
			textForm.graphics.endFill();
			textForm.x = 210;
			textForm.y = 550;
			addChild(textForm);
						
			textForm.addChild(text);
			text.autoSize = "left";
			text.text = String("Вы нарушили правило......!");
			
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset4);
			addChild(reset);
		}		
	}
		//ресет для кільцевої 
		function Reset4(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3);
					
					addChild(scena);
					scena.x = 716;
					scena.y = 1512;
					
					addChild(cars);
					cars.x = 511.2;
					cars.y = 138.65;
		}	
		
		
	
	//Відповідь червона - вірно - розїждаємось
	function onEnterFrameOtvet2Up15_3YES(e:Event):void 
	{
		
	stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3);
	
	cars2.y +=2
	//trace (cars2.y);
	
	if (cars2.y == 282) 
		{
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3YES1);
		}
					
	}	
	//Червона - вірно - повертаємо вниз червоною переходимо до обгону
	function onEnterFrameOtvet2Up15_3YES1(e:Event):void 
	{
		if (cars.rotation < -180) 
			{
				grad6 = -180;
			}
			else
			{
				grad6 += gradRot6;
						
			rad6 = (grad6* Math.PI)/180;
			speedX6 = speed6*Math.cos(rad6);
			speedY6 = speed6*Math.sin(rad6);
					
			if (grad6 >= 90)
			{
				cars.rotation = grad6;
			}
			else
			{
				grad6 = 90;
				cars.rotation = grad6;
			}
				
			cars.x += speedX6;
			cars.y += speedY6;	
					
			//trace(cars.y);
			if (cars.y >= 406)
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3YES1);	
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up15_3YES);	
				stage.addEventListener(Event.ENTER_FRAME,  onEnterFrameObgon);
			}				
		}	
	}
	
	
	
	/*******************************************
	***Після кільцевої сцена 7 обгон на мосту **
	*******************************************/
	
	function onEnterFrameObgon(e:Event):void 
	{
		scena.y -= 6;
		cars.y -= 2;
		cars2.y -= 3;
		
		//trace(scena.y);
		
		if (scena.y == 906)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameObgon);
			stage.addEventListener(Event.ENTER_FRAME,  onEnterFrameObgon1);
		}
	}
	
	//Запитання для обгону
	function onEnterFrameObgon1(e:Event):void 
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameObgon);
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameObgon1);
		
			st_right_down = new St_right_down_design();
			st_right_down.x = 375;
			st_right_down.y = 275;
			addChild(st_right_down);
			
			st = new St_design();
			st.x = 340;
			st.y = 450;
			st.rotation = 180;
			addChild(st);
			
			vopros7 = new Vopros7_design();
			vopros7.x = 400;
			vopros7.y = 600;
			addChild(vopros7);
				
			b4_1 = new b4_1_design();
			b4_1.x = 270;
			b4_1.y = 575;
			addChild(b4_1);
				
			b4_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameObgon_NO);
					removeChild(vopros7);
					removeChild(b4_1);
					removeChild(b4_3);
					removeChild(st_right_down);
					removeChild(st);
					
					onFileWrite("Возможен ли обгон в данной ситуации?", true);
				} 
					
			b4_3 = new b4_3_design();
			b4_3.x = 500;
			b4_3.y = 575;
			addChild(b4_3);				
			b4_3.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameObgon_YES);
					removeChild(vopros7);
					removeChild(b4_1);
					removeChild(b4_3);
					removeChild(st_right_down);
					removeChild(st);
					
					onFileWrite("Возможен ли обгон в данной ситуации?", false);
				} 		
	}
	//натиснули на мосту нет - трохи проїдемо і все
	function onEnterFrameObgon_NO(e:Event):void 
	{
		cars.y -= 1;
		cars2.y -= 1;
		scena.y -= 3;
		
		//trace(scena.y);
		if (scena.y == 378)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameObgon_NO);		
					pozd = new Pozd_design();
					pozd.x = 400;
					pozd.y = 300;
					addChild(pozd);	
			
			/*textForm.graphics.lineStyle(2, 0x1A171B);
			textForm.graphics.beginFill(0x99FF00);
			textForm.graphics.drawRect(0, 0, 300,120);
			textForm.graphics.endFill();
			textForm.x = 250;
			textForm.y = 300;
			addChild(textForm);
							
			textForm.addChild(text);
			text.autoSize = "left";
			text.text = String("Поздравляем! Вы успешно завершили задание!");*/
			
			/*reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset);
			addChild(reset);*/	
		}
	}
	
	//натиснули на мосту так - порушили правело - авария
	function onEnterFrameObgon_YES(e:Event):void 
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameObgon_YES);
			
			avaria = new avaria_design();
			avaria.x = 400;
			avaria.y = 300;
			addChild(avaria);
				
			textForm.graphics.lineStyle(2, 0x1A171B);
			textForm.graphics.beginFill(0xFFFF99);
			textForm.graphics.drawRect(0, 0, 300,350);
			textForm.graphics.endFill();
			textForm.x = 210;
			textForm.y = 550;
			addChild(textForm);
				
			textForm.addChild(text);
			text.autoSize = "left";
			text.text = String("Вы нарушили правило......!");
			
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset5);
			addChild(reset);
			
	}
		//ресет при обгоні
		function Reset5(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameObgon1);
					
					addChild(scena);
					scena.x = 716;
					scena.y = 906;
					
					addChild(cars);
					cars.x = 345.5;
					cars.y = 204;
					
					addChild(cars2);
					cars2.x = 340;
					cars2.y = 345;
					
		}	
	
		
	
	
	/**********************************
	***карточка 37, натиснули вправо **
	**********************************/
	function onEnterFrameOtvet2Up17(e:Event):void  
	{
		cars.y -= 2;
		//trace(cars.y);
		if (cars.y == 420)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_1);
		}
	}		
		//повертаємо вправо після вибору на карт 37
	function onEnterFrameOtvet2Up17_1(e:Event):void 
	{
		if (cars.rotation > 0) 
				{
					grad3 = 90;
				}
				else
				{
					grad3 += gradRot3;
						
					rad3 = (grad3* Math.PI)/180;
					speedX3 = speed3*Math.cos(rad3);
					speedY3 = speed3*Math.sin(rad3);
						
					cars.rotation = grad3;
					cars.x += speedX3;
					cars.y += speedY3;					
				}	
		scena.x -= 4;
		cars.x -= 1;
		//trace(scena.x);
		
		if (scena.x == -1108) 
		{
			//Синя машина
			cars2 = new Cars2_design();
			cars2.x = 460;
			cars2.y = 160; 
			cars2.rotation = -270;
			addChild(cars2);
		}
		
		if (scena.x == -1108) 
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_1);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2);
		}
	}
	
	//запитання карт 37 після вибору на право і проїзду до перехрестя
	function onEnterFrameOtvet2Up17_2(e:Event):void 
	{
		stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2);
				
		/*trace(scena.x+" трайс сцена х");
		trace(scena.y + " трайс сцена у");
		
		trace(cars.x+" трайс машина х");
		trace(cars.y + " трайс машина у");
		
		trace(cars2.x+" трайс машина2 х");
		trace(cars2.y + " трайс машина2 у");*/
		
			st = new St_design();
			st.x = 460;
			st.y = 270;
			st.rotation =-180;
			addChild(st);
			
			st_right_down = new St_right_down_design();
			st_right_down.x = 440;
			st_right_down.y = 420;
			addChild(st_right_down);
			
			st_left = new St_left_design();
			st_left.x = 520;
			st_left.y = 410;
			addChild(st_left);
			
			gaz = new Gaz_design();
			gaz.x = 540;
			gaz.y = 520;
			gaz.rotation = -90;
			addChild(gaz);
			
			vopros5 = new Vopros5_design();
			vopros5.x = 400;
			vopros5.y = 600;
			addChild(vopros5);
				
			b4_3 = new b4_3_design();
			b4_3.x = 270;
			b4_3.y = 585;
			addChild(b4_3);	
			b4_3.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					removeChild(vopros5);
					removeChild(b4_3);
					removeChild(b4_1);
					removeChild(st);
					removeChild(st_right_down);
					removeChild(st_left);
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2Yes);
					
					onFileWrite("В данной ситуация, красная машина должна проехать первой?", true);
				} 
					
			b4_1 = new b4_1_design();
			b4_1.x = 500;
			b4_1.y = 585;
			addChild(b4_1);				
			b4_1.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					removeChild(vopros5);
					removeChild(b4_3);
					removeChild(b4_1);
					removeChild(st);
					removeChild(st_right_down);
					removeChild(st_left);
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2No);
					
					onFileWrite("В данной ситуация, красная машина должна проехать первой?", false);
				} 
	}
	
	//кар 37, червона машина не проїде першою - не правельно - авария
	function onEnterFrameOtvet2Up17_2No(e:Event):void 
	{
		cars.x ++;
		cars2.y += 6;
		//trace(cars2.y);
		gaz.y -= 1;
		
		if (cars2.y == 394)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2No);
			
			avaria = new avaria_design();
			avaria.x = 400;
			avaria.y = 300;
			addChild(avaria);
				
			textForm.graphics.lineStyle(2, 0x1A171B);
			textForm.graphics.beginFill(0xFFFF99);
			textForm.graphics.drawRect(0, 0, 300,350);
			textForm.graphics.endFill();
			textForm.x = 210;
			textForm.y = 550;
			addChild(textForm);
				
			textForm.addChild(text);
			text.autoSize = "left";
			text.text = String("Вы нарушили правило......!");
			
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset6);
			addChild(reset);
		}			
	}
		//ресет - прехрестя на право 3-х машин 
		function Reset6(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2);
					
					addChild(scena);
					scena.x = -1108;
					scena.y = 1512;
					
					addChild(cars);
					cars.x = 353;
					cars.y = 391.95;
					
					addChild(cars2);
					cars2.x = 460;
					cars2.y = 160;
		}	
	
	//кар 37, червона машина  проїде першою - правельно і повертаємо вниз
	function onEnterFrameOtvet2Up17_2Yes(e:Event):void 
	{
		cars2.y += 1;
		//trace(cars2.y)
		gaz.y -= 1;
		if(cars.rotation > 90) 
			{
				grad4 = -90;
			}
			else
			{
				grad4 += gradRot4;
									
				rad4 = (grad4* Math.PI)/180;
				speedX4 = speed4*Math.cos(rad4);
				speedY4 = speed4*Math.sin(rad4);
							 
				cars.rotation = grad4;
				cars.x += speedX4;
				cars.y += speedY4;
			}	
			if (cars2.y == 268)
			{
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_3Yes);
			}
		
	}
	//після повороту вправо і вниз карт 37 -  їдемо вниз
	function onEnterFrameOtvet2Up17_3Yes(e:Event):void
	{
		cars.y -= 2;
		//trace(cars.y);
		scena.y -= 5;
		
		cars2.y -= 5;
		gaz.y -= 5;
		
		if (cars.y == 61.1)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_2Yes);
			removeChild(cars2);
			removeChild(gaz);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Down18);
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up17_3Yes);		
			
		}
		
	}
	
	
		/***************************************************************************************************************
		*Виконується , якщо ми відповіли правельно на запитання де знаходяться три авто після карточки 37 поворот вправо* 
		****************************************************************************************************************/	
	
		function onEnterFrameOtvet2Down18(e:Event):void
	{
		/*cars.y += 2;
		trace(cars.y +"машина");
		scena.y -= 5;
		trace(scena.y + "сцена");*/
		
		if (scena.y == 42)
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Down18);
			
			pozd = new Pozd_design();
			pozd.x = 400;
			pozd.y = 300;
			addChild(pozd);
			
		}
		
	}	
	
	
			
		/**************************************************************
		*Виконується , якщо ми натиснули стрілoчку вліво після сцени 1* 
		***************************************************************/	
		
		function onEnterFrame_left(e:Event):void 
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left);
					
			st_right1 = new St_right1_design();
			st_right1.x = 260;
			st_right1.y = 275;
			addChild(st_right1);
				
			/*	//блимає поворот
				var timerAdd: Timer = new Timer(1000);
				timerAdd.addEventListener(TimerEvent.TIMER, onTAdd);

				timerAdd.start();

				function onTAdd (e:TimerEvent):void {
					addChild(st_right);
					addChild(st_left);
				}
				
				var timerRemove: Timer = new Timer(2000);
				timerRemove.addEventListener(TimerEvent.TIMER, onTRemove);

				timerRemove.start();

				function onTRemove (e:TimerEvent):void {
					removeChild(st_right);
					removeChild(st_left);
					
				}*/
			
			
			st_left = new St_left_design();
			st_left.x = 450;
			st_left.y = 380;
			addChild(st_left);
			
			vopros1 = new Vopros1_design();
			vopros1.x = 400;
			vopros1.y = 600;
			addChild(vopros1);
				
			b1_1 = new b1_1_design();
			b1_1.x = 270;
			b1_1.y = 575;
			addChild(b1_1);
				
			b1_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left1);
					removeChild(vopros1);
					removeChild(b1_1);
					removeChild(b1_2);
					removeChild(st_left);
					removeChild(st_right1);
					
					onFileWrite("Водитель какого автомобиля должен уступить дорогу?", true);
				} 
					
			b1_2 = new b1_2_design();
			b1_2.x = 500;
			b1_2.y = 575;
			addChild(b1_2);				
			b1_2.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrameOtvet2Up);
					removeChild(vopros1);
					removeChild(b1_1);
					removeChild(b1_2);
					removeChild(st_left);
					removeChild(st_right1);
					
					onFileWrite("Водитель какого автомобиля должен уступить дорогу?", false);
				} 		
		}
		
		//якщо натиснули 
		function onEnterFrame_left1(e:Event):void 
		{
			//cars.y -=2;	
			gaz.x += 2;
			//trace(gaz.x);
			
			
			if	(gaz.x == 316)
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left1);
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left2);
				
			}
		}
		
		function onEnterFrame_left2(e:Event):void 
		{
			//певертаємо газон
				if(gaz.rotation < -90)
				{
					grad1 = -90;
				}
				else
				{
					grad1 += gradRot1;
									
					rad1 = (grad1* Math.PI)/180;
					speedX1 = speed1*Math.cos(rad1);
					speedY1 = speed1*Math.sin(rad1);
					
					 
					gaz.rotation = grad1;
					gaz.x += speedX1;
					gaz.y += speedY1;
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left3);
				}				
				
		}
		
		function onEnterFrame_left3(e:Event):void 
		{
							
			cars.y -= 1;
			//trace(cars.y);
			gaz.y -= 1;			
			
			if (cars.y == 322) 
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left2);
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left3);
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left4);
			}
		}
		
		
		/************************************************
		*******   Сцена 3 - мотоцикол и авто    *********
		*************************************************/
		
		function onEnterFrame_left4(e:Event):void 
		{			
			//певертаємо авто	
			if (cars.rotation > 0) 
				{
					grad = -180;
				}
				else
				{
					grad += gradRot;
						
					rad = (grad* Math.PI)/180;
					speedX = speed*Math.cos(rad);
					speedY = speed*Math.sin(rad);
						
					cars.rotation = grad;
					cars.x += speedX;
					cars.y += speedY;					
				}
				
				
			scena.x += 4;
			cars.x += 2;
			//trace(scena.x);
			gaz.x += 4;
			gaz.y -= 1;
			if (scena.x >= 60)
			{
					cars.x -= 3;
			}
					
			if (scena.x == 388)
			{
				moto = new Moto_design();
				moto.x = 215;
				moto.y = 400;
				moto.rotation = -90;
				addChild(moto);
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left4);
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left5);
			}
		}
		
		
		//запитання для сцени 3( мотоцикл-авто)
		function onEnterFrame_left5(e:Event):void 
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left5);
			
			st_left = new St_left_design();
			st_left.x = 190;
			st_left.y = 320;
			addChild(st_left);
			
			//блимає поворот
				/*var timerAdd: Timer = new Timer(1000);
				timerAdd.addEventListener(TimerEvent.TIMER, onTAdd);

				timerAdd.start();

				function onTAdd (e:TimerEvent):void {
					addChild(st);
					addChild(st_left);
				}
				
				var timerRemove: Timer = new Timer(2000);
				timerRemove.addEventListener(TimerEvent.TIMER, onTRemove);

				timerRemove.start();

				function onTRemove (e:TimerEvent):void {
					removeChild(st);
					removeChild(st_left);
				}
				*/
			st = new St_design();
			st.x = 470;
			st.y = 230;
			st.rotation =-90;
			addChild(st);
			
			vopros3 = new Vopros3_design();
			vopros3.x = 400;
			vopros3.y = 600;
			addChild(vopros3);
				
			b3_1 = new b3_1_design();
			b3_1.x = 270;
			b3_1.y = 585;
			addChild(b3_1);
				
			b3_1.addEventListener(MouseEvent.CLICK, otvet1Up);
				
			function otvet1Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left6);
					removeChild(vopros3);
					removeChild(b3_1);
					removeChild(b2_2);
					removeChild(st);
					removeChild(st_left);
					
					onFileWrite("Водитель какого транспортного средства имеет преимущественное право проезда ?", true);
				} 
					
			b2_2 = new b2_2_design();
			b2_2.x = 500;
			b2_2.y = 585;
			addChild(b2_2);				
			b2_2.addEventListener(MouseEvent.CLICK, otvet2Up);
				
			function otvet2Up(e:MouseEvent):void
				{
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left7);
					removeChild(vopros3);
					removeChild(b3_1);
					removeChild(b2_2);
					removeChild(st);
					removeChild(st_left);
					
					onFileWrite("Водитель какого транспортного средства имеет преимущественное право проезда ?", false);
				} 
		}
		
		//аварія сцена 3
		function onEnterFrame_left7(e:Event):void 
		{
			cars.x -= 3;
			//trace(cars.x);
			moto.y -= 2;
			
			if (cars.x == 298.75)
			{

				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left7);
				avaria = new avaria_design();
				avaria.x = 400;
				avaria.y = 300;
				addChild(avaria);
									
				textForm.graphics.lineStyle(2, 0x1A171B);
				textForm.graphics.beginFill(0xFFFF99);
				textForm.graphics.drawRect(0, 0, 300,350);
				textForm.graphics.endFill();
				textForm.x = 210;
				textForm.y = 550;
				addChild(textForm);
					
				textForm.addChild(text);
				text.autoSize = "left";
				text.text = String("Вы нарушили правило......!");
				
			reset = new Reset_design();
			reset.x = 400;
			reset.y = 350;
			reset.addEventListener(MouseEvent.CLICK, Reset2);
			addChild(reset);
			
			}
		}
		
		//ресет для сцени 3 - авто+мото	
		function Reset2(e:Event):void 
		{
			
			while (numChildren > 0)
				{
					removeChildAt(0);	
				}				
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left5);
					
					addChild(scena);
					scena.x = 388;
					scena.y = -100;
					
					addChild(cars);
					cars.x = 577.75;
					cars.y = 233.2;
					
					addChild(moto);
					moto.x = 215;
					moto.y = 400;
					
		}	
						
		// їдемо далі
		function onEnterFrame_left6(e:Event):void 
		{
			moto.y -= 3;
			//trace(moto.y);
			if (moto.y == 289)
			{
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left8);
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left6);
			}
			
		}
		
		//їдемо далі
		function onEnterFrame_left8(e:Event):void 
		{
			cars.x -= 3;
			//trace(cars.x);
			
			//певертаємо moto
			if (moto.rotation > 0) 
				{
					grad2 = -180;
				}
				else
				{
					grad2 += gradRot2;
						
					rad2 = (grad2* Math.PI)/180;
					speedX2 = speed*Math.cos(rad2);
					speedY2 = speed*Math.sin(rad2);
						
					moto.rotation = grad2;
					moto.x += speedX2;
					moto.y += speedY2;
					
					
					
					stage.addEventListener(Event.ENTER_FRAME, onEnterFrame_left9);	
				}
			moto.x -= 2;
		}
		
		//завершення сцени 3 мото+авто
		function onEnterFrame_left9(e:Event):void 
		{
			
			//trace(cars.x);
			
			if (cars.x == -124.25)
				{
					stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left8);
					
					pozd = new Pozd_design();
					pozd.x = 400;
					pozd.y = 300;
					addChild(pozd);	
					
					
					/*textForm.graphics.lineStyle(2, 0x1A171B);
					textForm.graphics.beginFill(0x99FF00);
					textForm.graphics.drawRect(0, 0, 300,120);
					textForm.graphics.endFill();
					textForm.x = 250;
					textForm.y = 300;
					addChild(textForm);
							
					textForm.addChild(text);
					text.autoSize = "left";
					text.text = String("Поздравляем! Вы успешно завершили задание!");*/
					
					stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame_left9);
					
					/*reset = new Reset_design();
					reset.x = 400;
					reset.y = 350;
					reset.addEventListener(MouseEvent.CLICK, Reset);
					addChild(reset);*/	
				}	
		
			
			
			
			
			
		}
		
	}
	
}