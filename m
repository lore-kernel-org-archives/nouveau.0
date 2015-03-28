From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89483] [NV11] Hangs on boot with external monitor
 active on Dell Latitude C810
Date: Sat, 28 Mar 2015 14:35:27 +0000
Message-ID: <bug-89483-8800-TYuGXJBmKF@http.bugs.freedesktop.org/>
References: <bug-89483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1959111750=="
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


--===============1959111750==
Content-Type: multipart/alternative; boundary="1427553327.7cbAD1.3430"; charset="UTF-8"


--1427553327.7cbAD1.3430
Date: Sat, 28 Mar 2015 14:35:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89483

--- Comment #7 from Ondrej Zary <linux-ZCIryABCsrmttCpgsWEBFmD2FQJk+8+b@public.gmane.org> ---
Hangs while disabling LVDS:

[  261.444665] before fbcon_init
[  261.444733] before helper_prepare
[  261.444743] before helper_init
[  261.444769] before helper_add_all_conn
[  261.444780] after helper_add_all_conn, ret=0
[  261.444833] before disable_unused
[  261.444843] drm_helper_disable_unused_functions
[  261.445683] __drm_helper_disable_unused_functions
[  261.445697] encoder=DAC-28
[  261.445755] encoder not in use
[  261.445765] setting dpms off
[  261.445797] encoder disabled ok
[  261.445806] encoder=LVDS-30
[  261.445859] encoder not in use
[  261.445868] setting dpms off

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427553327.7cbAD1.3430
Date: Sat, 28 Mar 2015 14:35:27 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV11] Hangs on boot with external monitor active on Dell Latitude C810"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89483">bug 89483</a>
              from <span class="vcard"><a class="email" href="mailto:linux&#64;rainbow-software.org" title="Ondrej Zary &lt;linux&#64;rainbow-software.org&gt;"> <span class="fn">Ondrej Zary</span></a>
</span></b>
        <pre>Hangs while disabling LVDS:

[  261.444665] before fbcon_init
[  261.444733] before helper_prepare
[  261.444743] before helper_init
[  261.444769] before helper_add_all_conn
[  261.444780] after helper_add_all_conn, ret=0
[  261.444833] before disable_unused
[  261.444843] drm_helper_disable_unused_functions
[  261.445683] __drm_helper_disable_unused_functions
[  261.445697] encoder=DAC-28
[  261.445755] encoder not in use
[  261.445765] setting dpms off
[  261.445797] encoder disabled ok
[  261.445806] encoder=LVDS-30
[  261.445859] encoder not in use
[  261.445868] setting dpms off</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427553327.7cbAD1.3430--

--===============1959111750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1959111750==--
