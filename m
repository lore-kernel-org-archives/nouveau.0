From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] Nvidia nouveau drivers hangs all gnome when
 open the new legacy tray in 3.16.0
Date: Fri, 03 Apr 2015 09:35:12 +0000
Message-ID: <bug-89842-8800-GGU9NmJEh0@http.bugs.freedesktop.org/>
References: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0686569479=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89842-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0686569479==
Content-Type: multipart/alternative; boundary="1428053712.FEEDf2.23340"; charset="UTF-8"


--1428053712.FEEDf2.23340
Date: Fri, 3 Apr 2015 09:35:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

--- Comment #4 from Arjen <arjen-eXgbS2E5kEI@public.gmane.org> ---
I'm also getting the same errors since april 1st:

Apr 01 11:07:08 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[4997]]
multiple instances of buffer 228 on validation list
Apr 01 11:36:47 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[905]]
multiple instances of buffer 255 on validation list
Apr 01 13:51:37 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[2939]]
multiple instances of buffer 146 on validation list
Apr 02 12:20:26 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[2939]]
multiple instances of buffer 415 on validation list
Apr 02 17:00:46 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[895]]
multiple instances of buffer 327 on validation list


Just before the 1st crash I upgrade mesa:

[2015-04-01 09:55] [ALPM] upgraded mesa (10.5.1-2 -> 10.5.2-1)


Versions:
Kernel 3.19.2-1-ARCH
xf86-video-nouveau 1.0.11-3
mesa 10.5.2-1
Gnome 3.14.2

So I think this is mesa related, and not related to Gnome 3.16.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428053712.FEEDf2.23340
Date: Fri, 3 Apr 2015 09:35:12 +0000
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
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">bug 89842</a>
              from <span class="vcard"><a class="email" href="mailto:arjen&#64;parse.nl" title="Arjen &lt;arjen&#64;parse.nl&gt;"> <span class="fn">Arjen</span></a>
</span></b>
        <pre>I'm also getting the same errors since april 1st:

Apr 01 11:07:08 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[4997]]
multiple instances of buffer 228 on validation list
Apr 01 11:36:47 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[905]]
multiple instances of buffer 255 on validation list
Apr 01 13:51:37 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[2939]]
multiple instances of buffer 146 on validation list
Apr 02 12:20:26 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[2939]]
multiple instances of buffer 415 on validation list
Apr 02 17:00:46 arjen-imac.office.react.nl kernel: nouveau E[gnome-shell[895]]
multiple instances of buffer 327 on validation list


Just before the 1st crash I upgrade mesa:

[2015-04-01 09:55] [ALPM] upgraded mesa (10.5.1-2 -&gt; 10.5.2-1)


Versions:
Kernel 3.19.2-1-ARCH
xf86-video-nouveau 1.0.11-3
mesa 10.5.2-1
Gnome 3.14.2

So I think this is mesa related, and not related to Gnome 3.16.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428053712.FEEDf2.23340--

--===============0686569479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0686569479==--
