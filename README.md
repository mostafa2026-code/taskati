# taskaty



# Taskaty App

**Taskaty** هو مشروع Flutter تعليمي، هدفه تعلم التعامل مع الصور، إدخال النصوص، وإنشاء شاشات مخصصة.

---

## وصف المشروع

في المشروع ده اتعلمنا:  

1. كيفية رفع صورة من:  
   - **الكاميرا** (Camera)  
   - **المعرض** (Gallery)  

2. استخدام **TextEditingController** لإدارة **TextField** وقراءة البيانات المدخلة من المستخدم.  

3. إنشاء **شاشات مخصصة (Custom Screens)** باستخدام Widgets مخصصة.

4. التعامل مع **Permissions** على أنظمة Android و iOS لتفعيل الوصول للكاميرا والمعرض.

5. استخدام Widgets جاهزة ومخصصة مثل:  
   - CircleAvatar لعرض الصورة.  
   - Buttons مخصصة للتنقل بين الشاشات.  
   - Snackbars لعرض رسائل التحقق من البيانات.  

---

## المميزات

- رفع الصور من الكاميرا أو المعرض وعرضها مباشرة على الشاشة.  
- التحقق من إدخال الاسم والصورة قبل الانتقال للشاشة التالية.  
- إدارة البيانات المدخلة باستخدام **Controllers**.  
- تصميم واجهات بسيطة وسهلة الاستخدام مع الحفاظ على التناسق والPadding.  

---

## التقنيات المستخدمة

- **Flutter** لإعداد الواجهة والتفاعل مع المستخدم.  
- **Image Picker** لرفع الصور من الكاميرا والمعرض.  
- **TextEditingController** لإدارة إدخال النصوص.  
- **Navigator** للتنقل بين الشاشات.  
- إدارة **Permissions** على Android و iOS.

---

## طريقة التشغيل

1. افتح المشروع في VS Code أو Android Studio.  
2. شغل **flutter pub get** لتثبيت الحزم المطلوبة.  
3. تأكد من ضبط Permissions للكاميرا والمعرض على Android و iOS.  
4. شغل التطبيق على محاكي أو جهاز حقيقي.  

---

## ملاحظات

- التطبيق يستخدم **Custom Widgets** لتسهيل إعادة استخدام الأكواد.  
- تم التركيز على التعلم العملي لكيفية التعامل مع الصور والنصوص.  

---


A new Flutter project.
==========================topic search==========================
Introduction to caching
At its most basic, all caching strategies amount to the same three-step operation, represented with the following pseudocode:

Data? _cachedData;

Future<Data> get data async {
    // Step 1: Check whether your cache already contains the desired data
    if (_cachedData == null) {
        // Step 2: Load the data if the cache was empty
        _cachedData = await _readData();
    }
    // Step 3: Return the value in the cache
    return _cachedData!;
}

Common caching terminology
Caching comes with its own terminology, some of which is defined and explained below.
Cache hit
An app is said to have had a cache hit when the cache already contained their desired information and loading it from the real source of truth was unnecessary.
Cache miss
An app is said to have had a cache miss when the cache was empty and the desired data is loaded from the real source of truth, and then saved to the cache for future reads.
مخاطر تخزين البيانات مؤقتًا


تتعرض جميع استراتيجيات التخزين المؤقت لخطر الاحتفاظ بالبيانات القديمة. لسوء الحظ،
 فإن عملية التحقق من حداثة ذاكرة التخزين المؤقت غالبًا ما تستغرق وقتًا طويلاً حتى تكتمل مثل تحميل البيانات المعنية بالكامل. وهذا يعني أن معظم التطبيقات تميل إلى الاستفادة من تخزين البيانات مؤقتًا فقط إذا كانت تثق في أن البيانات جديدة في وقت التشغيل دون التحقق منها.
 تخزين البيانات في الذاكرة المحلية

 ستراتيجية التخزين المؤقت الأبسط والأكثر أداءً هي التخزين المؤقت في الذاكرة. الجانب السلبي لهذه الاستراتيجية هو أنه نظرًا لأن ذاكرة التخزين المؤقت محفوظة فقط في ذاكرة النظام، فلا يتم الاحتفاظ بأي بيانات بعد الجلسة التي تم تخزينها فيها مؤقتًا في الأصل. (بالطبع، هذا "الجانب السلبي" له أيضًا الجانب الإيجابي المتمثل في حل معظم مشكلات ذاكرة التخزين المؤقت القديمة تلقائيًا!)

 Imagine a UserRepository class that is also tasked with caching users in memory to avoid duplicate network requests. Its implementation might look like this:




 class UserRepository {
  UserRepository(this.api);
  
  final Api api;
  final Map<int, User?> _userCache = {};

  Future<User?> loadUser(int id) async {
    if (!_userCache.containsKey(id)) {
      final response = await api.get(id);
      if (response.statusCode == 200) {
        _userCache[id] = User.fromJson(response.body);
      } else {
        _userCache[id] = null;
      }
    }
    return _userCache[id];
  }
}

This UserRepository follows multiple proven design principles including:

dependency injection, which helps with testing
loose coupling, which protects surrounding code from its implementation details, and
separation of concerns, which prevents its implementation from juggling too many concerns.              الحتة دي مش فاهمها قوي   

يعني اللي انا فاهمه ان ال caching data عبارة عن مبدا ان البيانات بدل ما تتمسح من الرام بعد ما المستخدم يخلص استعمال التطبيق   احنا بنخزنها في بيانات محلية والبشمهندس قال اننا هناخدها وهنستخد hive واللي اعرفه عن hive انها nosql  يعني شغالة زي الماب <key: value >   ويعني مش معقول تطبيق اطفال زي التاسك مانجر دا لازم يحتاج النت علشان يشتغل وبالتالي لازم البيانات دي تتخزن محليها  وامثلتها كتير 


منها لما النت يفصل مني وانا على لينكد ان ممكن لاقي البوستات اللي انا شوفتها قبل كدا لكن مش بشوف جديد   


=====================================================================



