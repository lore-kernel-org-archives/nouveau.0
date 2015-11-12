From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Thu, 12 Nov 2015 18:25:49 +0000
Message-ID: <bug-92922-8800-Fbi4UjSuN8@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074833915=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0074833915==
Content-Type: multipart/alternative; boundary="1447352748.ad00fF1.18527"; charset="UTF-8"


--1447352748.ad00fF1.18527
Date: Thu, 12 Nov 2015 18:25:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92922

--- Comment #2 from Antonis Karagiannis <antokara-lAq2i09A0t4Cep0kKqy/Kg@public.gmane.org> ---
Installed Packages
mesa-dri-drivers.x86_64      11.0.4-1.20151105.fc23
mesa-filesystem.x86_64       11.0.4-1.20151105.fc23
mesa-libEGL.i686             11.0.4-1.20151105.fc23
mesa-libEGL.x86_64           11.0.4-1.20151105.fc23
mesa-libGL.i686              11.0.4-1.20151105.fc23
mesa-libGL.x86_64            11.0.4-1.20151105.fc23
mesa-libGLES.x86_64          11.0.4-1.20151105.fc23
mesa-libGLU.x86_64           9.0.0-9.fc23
mesa-libgbm.i686             11.0.4-1.20151105.fc23
mesa-libgbm.x86_64           11.0.4-1.20151105.fc23
mesa-libglapi.i686           11.0.4-1.20151105.fc23
mesa-libglapi.x86_64         11.0.4-1.20151105.fc23
mesa-libwayland-egl.x86_64   11.0.4-1.20151105.fc23
mesa-libxatracker.x86_64     11.0.4-1.20151105.fc23

I hope this clarifies the mesa versions installed.

Now as for building the custom mesa lib, I haven't done that before.
If it's just ./configure && make && make install, I just might give it a try
;-)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447352748.ad00fF1.18527
Date: Thu, 12 Nov 2015 18:25:48 +0000
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
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922">bug 92922</a>
              from <span class="vcard"><a class="email" href="mailto:antokara&#64;precise.gr" title="Antonis Karagiannis &lt;antokara&#64;precise.gr&gt;"> <span class="fn">Antonis Karagiannis</span></a>
</span></b>
        <pre>Installed Packages
mesa-dri-drivers.x86_64      11.0.4-1.20151105.fc23
mesa-filesystem.x86_64       11.0.4-1.20151105.fc23
mesa-libEGL.i686             11.0.4-1.20151105.fc23
mesa-libEGL.x86_64           11.0.4-1.20151105.fc23
mesa-libGL.i686              11.0.4-1.20151105.fc23
mesa-libGL.x86_64            11.0.4-1.20151105.fc23
mesa-libGLES.x86_64          11.0.4-1.20151105.fc23
mesa-libGLU.x86_64           9.0.0-9.fc23
mesa-libgbm.i686             11.0.4-1.20151105.fc23
mesa-libgbm.x86_64           11.0.4-1.20151105.fc23
mesa-libglapi.i686           11.0.4-1.20151105.fc23
mesa-libglapi.x86_64         11.0.4-1.20151105.fc23
mesa-libwayland-egl.x86_64   11.0.4-1.20151105.fc23
mesa-libxatracker.x86_64     11.0.4-1.20151105.fc23

I hope this clarifies the mesa versions installed.

Now as for building the custom mesa lib, I haven't done that before.
If it's just ./configure &amp;&amp; make &amp;&amp; make install, I just might give it a try
;-)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447352748.ad00fF1.18527--

--===============0074833915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0074833915==--
