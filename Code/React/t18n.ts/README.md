<p>การเพิ่ม i18n (internationalization) ในโปรเจ็กต์ React ที่ใช้ TypeScript ช่วยให้แอปพลิเคชันของคุณสามารถรองรับหลายภาษา คุณสามารถทำได้ด้วยหลายวิธี แต่วิธีที่แนะนำคือการใช้ <code>react-i18next</code> ซึ่งเป็นไลบรารียอดนิยมสำหรับการจัดการ i18n ใน React ตามขั้นตอนต่อไปนี้เพื่อเพิ่ม i18n ในโปรเจ็กต์ของคุณ:</p>

<ol>
	<li>ติดตั้ง <code>react-i18next</code>, <code>i18next</code> และประเภทตัวช่วย:</li>
</ol>

<pre>
<code class="language-bash">npm install react-i18next i18next
npm install --save-dev @types/react-i18next</code></pre>

<ol start="2">
	<li>สร้างแฟ้มภาษาในโครงสร้างโปรเจ็กต์ของคุณ โดยสามารถกำหนดชื่อโฟลเดอร์เป็น <code>locales</code> และสร้างโฟลเดอร์ย่อยสำหรับแต่ละภาษา ตัวอย่างเช่น:</li>
</ol>

<pre>
<code>src/
  locales/
    en/
      translation.json
    th/
      translation.json
</code></pre>

<ol start="3">
	<li>ในแต่ละไฟล์ <code>translation.json</code>, คุณสามารถเพิ่มคู่คีย์-ค่าที่เป็นข้อความสำหรับแต่ละภาษา ตัวอย่างเช่น:</li>
</ol>

<pre>
<code class="language-json">// src/locales/en/translation.json
{
  "welcome": "Welcome to our application!",
  "changeLanguage": "Change language"
}

// src/locales/th/translation.json
{
  "welcome": "ยินดีต้อนรับสู่แอปพลิเคชันของเรา!",
  "changeLanguage": "เปลี่ยนภาษา"
}
</code></pre>

<ol start="4">
	<li>ตั้งค่า <code>i18next</code> และ <code>react-i18next</code> ในโปรเจ็กต์ของคุณ ในไฟล์ <code>src/i18n.ts</code>:</li>
</ol>

<pre>
<code class="language-javascript">import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import en from "./locales/en/translation.json";
import th from "./locales/th/translation.json";

const resources = {
  en: { translation: en },
  th: { translation: th },
};

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: "en", // กำหนดภาษาเริ่มต้น
    keySeparator: false, // ใช้เฉพาะคีย์แบบแบน
    interpolation: {
      escapeValue: false, // ไม่ต้องใช้ xss กัน
    },
  });

export default i18n;
</code></pre>

<ol start="5">
	<li>นำเข้าและเรียกใช้ i18n ในไฟล์ <code>src/index.tsx</code> ของคุณ:</li>
</ol>

<pre>
<code class="language-javascript">import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import './i18n'; // นำเข้า i18n

ReactDOM.render(
  &lt;React.StrictMode&gt;
    &lt;App /&gt;
  &lt;/React.StrictMode&gt;,
  document.getElementById('root')
);

reportWebVitals();
</code></pre>

<ol start="6">
	<li>ใช้งาน <code>react-i18next</code> ในคอมโพเนนต์ของคุณ:</li>
</ol>

<pre>
<code class="language-javascript">import React from 'react';
import { useTranslation } from 'react-i18next';

function App() {
  const { t, i18n } = useTranslation();

  const changeLanguage = (language: string) =&gt; {
    i18n.changeLanguage(language);
  };

  return (
    &lt;div&gt;
      &lt;h1&gt;{t('welcome')}&lt;/h1&gt;
      &lt;button onClick={() =&gt; changeLanguage('en')}&gt;English&lt;/button&gt;
      &lt;button onClick={() =&gt; changeLanguage('th')}&gt;ภาษาไทย&lt;/button&gt;
    &lt;/div&gt;
  );
}

export default App;
</code></pre>

<p>ตอนนี้โปรเจ็กต์ React ที่ใช้ TypeScript ของคุณจะมีระบบ i18n ที่ใช้งานได้ด้วยการใช้ <code>react-i18next</code>. คุณสามารถเพิ่มภาษาเพิ่มเติม และคีย์แปลได้ตามต้องการ โดยใช้โครงสร้างที่เราตั้งค่าไว้ในขั้นตอนข้างต้น.</p>