From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89483] [NV11] Hangs on boot with external monitor
 active on Dell Latitude C810
Date: Sat, 28 Mar 2015 17:13:57 +0000
Message-ID: <bug-89483-8800-n0FWhXnAmY@http.bugs.freedesktop.org/>
References: <bug-89483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074571886=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2074571886==
Content-Type: multipart/alternative; boundary="1427562837.F1ac6aCb1.5944"; charset="UTF-8"


--1427562837.F1ac6aCb1.5944
Date: Sat, 28 Mar 2015 17:13:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89483

--- Comment #9 from Ondrej Zary <linux-ZCIryABCsrmttCpgsWEBFmD2FQJk+8+b@public.gmane.org> ---
It looks like it hangs in nv04_dfp_get_bound_head() in the final NVReadRAMDAC
call (in return):

[  356.630063] encoder disabled ok
[  356.630072] encoder=LVDS-30
[  356.630125] encoder not in use
[  356.630134] setting dpms off
[  356.630156] nv04_lvds_dpms
[  356.630167] Setting dpms mode 3 on lvds encoder (output 1)
[  356.630219] before power_scripts
[  356.630229] use_power_scripts
[  356.630251] nv04_dfp_get_bound_head
[  356.630261] nv04_dfp_get_bound_head after writeRAMDAC

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427562837.F1ac6aCb1.5944
Date: Sat, 28 Mar 2015 17:13:57 +0000
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
   title="NEW - [NV11] Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV11] Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483">bug 89483</a>
              from <span class="vcard"><a class="email" href="mailto:linux&#64;rainbow-software.org" title="Ondrej Zary &lt;linux&#64;rainbow-software.org&gt;"> <span class="fn">Ondrej Zary</span></a>
</span></b>
        <pre>It looks like it hangs in nv04_dfp_get_bound_head() in the final NVReadRAMDAC
call (in return):

[  356.630063] encoder disabled ok
[  356.630072] encoder=LVDS-30
[  356.630125] encoder not in use
[  356.630134] setting dpms off
[  356.630156] nv04_lvds_dpms
[  356.630167] Setting dpms mode 3 on lvds encoder (output 1)
[  356.630219] before power_scripts
[  356.630229] use_power_scripts
[  356.630251] nv04_dfp_get_bound_head
[  356.630261] nv04_dfp_get_bound_head after writeRAMDAC</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427562837.F1ac6aCb1.5944--

--===============2074571886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2074571886==--
