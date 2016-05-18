# AC_Assessment
Q1: 1~100的奇數和 //解法在.playground
    思考過程：1. for loop 1~100
              2. 利用餘數2 來判斷是否是奇數
              3. 利用step2的判斷來決定是否進行累加
              4. 於迴圈運算結束後將結果輸出
              
Q2: 依照投影片畫面呈現
    處理過程：1. 在storyBoard上 設置兩個 view，由於資訊不明確，所以用uiview / imageview / button 等都能完成，
                 我選擇用uiview處理，兩個view分別為橘色與綠色
              2. 設置完view之後，先設定backGround color ，利用滴管來取得投影片上個別的顏色
              3. 橘色的constrain: 左邊與下面各設置15 與綠色水平設置5
                 綠色的constrain: 右邊與下面各設置15 與橘色水平設置5
                 互相等寬同高，橘色與superview同高：1:10的比例設定
                 
Q3: viewController Life Cycle:
    開啟時：依序觸發
            application(_:didFinishLaunchingWithOptions:)
            viewDidLoad()
            viewWillAppear
            applicationDidBecomeActive
            viewDidLayoutSubviews()
            viewDidAppear
            
    按下HOME鍵時：依序觸發
            applicationWillResignActive
            applicationDidEnterBackground
            
    再次從背景中喚醒：依序觸發
            applicationWillEnterForeground
            applicationDidBecomeActive
