From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84721] [NVC1] Nvidia Geforce GT 630 using nouveau on
 3.16 kernel. dangerous Fan speed
Date: Thu, 29 Jan 2015 21:39:05 +0000
Message-ID: <bug-84721-8800-PgiTb4Y3Gb@http.bugs.freedesktop.org/>
References: <bug-84721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1947581941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1947581941==
Content-Type: multipart/alternative; boundary="1422567545.CE3CB6c5.6349"; charset="UTF-8"


--1422567545.CE3CB6c5.6349
Date: Thu, 29 Jan 2015 21:39:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84721

--- Comment #15 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to Krzysztof Katowicz-Kowalewski from comment #14)
> 0e994d645627bb67088ae4860e9a0295b123f7b0 is the first bad commit
> commit 0e994d645627bb67088ae4860e9a0295b123f7b0
> Author: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
> Date:   Wed Feb 19 01:04:56 2014 +0100
>  
>     drm/nouveau/therm: let the vbios decide on the automatic fan management
> mode


Following to this there was a conversation on #nouveau:

Reverting a part of the above noted patch:

-    /* starting from fermi, fan management is always linear */
-    if (nv_device(bios)->card_type >= NV_C0 &&
-        fan->fan_mode == NVBIOS_THERM_FAN_OTHER) {
-        fan->fan_mode = NVBIOS_THERM_FAN_LINEAR;
-    }

hides the bug away again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422567545.CE3CB6c5.6349
Date: Thu, 29 Jan 2015 21:39:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84721">bug 84721</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to Krzysztof Katowicz-Kowalewski from <a href="show_bug.cgi?id=84721#c14">comment #14</a>)
<span class="quote">&gt; 0e994d645627bb67088ae4860e9a0295b123f7b0 is the first bad commit
&gt; commit 0e994d645627bb67088ae4860e9a0295b123f7b0
&gt; Author: Martin Peres &lt;<a href="mailto:martin.peres&#64;labri.fr">martin.peres&#64;labri.fr</a>&gt;
&gt; Date:   Wed Feb 19 01:04:56 2014 +0100
&gt;  
&gt;     drm/nouveau/therm: let the vbios decide on the automatic fan management
&gt; mode</span >


Following to this there was a conversation on #nouveau:

Reverting a part of the above noted patch:

-    /* starting from fermi, fan management is always linear */
-    if (nv_device(bios)-&gt;card_type &gt;= NV_C0 &amp;&amp;
-        fan-&gt;fan_mode == NVBIOS_THERM_FAN_OTHER) {
-        fan-&gt;fan_mode = NVBIOS_THERM_FAN_LINEAR;
-    }

hides the bug away again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422567545.CE3CB6c5.6349--

--===============1947581941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1947581941==--
