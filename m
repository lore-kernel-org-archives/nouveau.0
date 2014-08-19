From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80506] Video failed on resume from suspend - G94 /
 GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2
Date: Tue, 19 Aug 2014 17:02:26 +0000
Message-ID: <bug-80506-8800-uKmcKpEfll@http.bugs.freedesktop.org/>
References: <bug-80506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177838706=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80506-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1177838706==
Content-Type: multipart/alternative; boundary="1408467746.B6a718c2.20204"; charset="us-ascii"


--1408467746.B6a718c2.20204
Date: Tue, 19 Aug 2014 17:02:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80506

--- Comment #4 from Andrei Amuraritei <sirdeiu-lCx5UHQiBEisTnJN9+BGXg@public.gmane.org> ---
Hello, I'm getting this also with an NVIDIA GTX 570 - NVC8 GF110 card with
kernel 3.16.0-1-desktop on openSUSE Factory on x86_64.

Suspend works ok. Resume doesn't. Screen blank. If press Ctrl Alt F2 and then
Ctrl Alt Del PC does reboot.

I've tried with NVIDIA pro. driver 320.24 and beta 343.13, those work OK.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408467746.B6a718c2.20204
Date: Tue, 19 Aug 2014 17:02:26 +0000
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
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80506#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80506">bug 80506</a>
              from <span class="vcard"><a class="email" href="mailto:sirdeiu&#64;bydeiu.net" title="Andrei Amuraritei &lt;sirdeiu&#64;bydeiu.net&gt;"> <span class="fn">Andrei Amuraritei</span></a>
</span></b>
        <pre>Hello, I'm getting this also with an NVIDIA GTX 570 - NVC8 GF110 card with
kernel 3.16.0-1-desktop on openSUSE Factory on x86_64.

Suspend works ok. Resume doesn't. Screen blank. If press Ctrl Alt F2 and then
Ctrl Alt Del PC does reboot.

I've tried with NVIDIA pro. driver 320.24 and beta 343.13, those work OK.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408467746.B6a718c2.20204--

--===============1177838706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1177838706==--
