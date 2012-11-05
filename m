From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] bad/missing graphics with NV11 / GeForce
	2MX/MX400
Date: Mon, 05 Nov 2012 14:14:09 +0000
Message-ID: <bug-51477-8800-j8gq7NX2QC@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743675729=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0743675729==
Content-Type: multipart/alternative; boundary="1352124849.cdcC2.16914"; charset="us-ascii"


--1352124849.cdcC2.16914
Date: Mon, 5 Nov 2012 14:14:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #13 from D. Holden <daveholden2008-97jfqw80gc6171pxa8y+qA@public.gmane.org> ---
Same for me, I use a Geforce 4 MX440 and it always worked fine until I tried
the latest Ubuntu/Lubuntu/Xubuntu version. 

The following problems occur:

1. On Ubuntu the Unity panels do now show
2. On Xubuntu (XFCE) it works (quite fast), but the terminal text has the color
of the window below (goes away when moving window). Also, there are other
drawing issues with the panels of the default file manager and so on. However
most applications (like FireFox and Chromium) work as expected
3. On Lubuntu the terminal text is ok, but there are also issues with the file
manager and other LXDE apps
4. All desktop versions seem to have issues with radio-buttons, check-boxes and
so on. The color and brightness are not correct.

Is seems that the speed of the new nouveau driver has increased significantly
on the MX440, but at the cost of (some) compatibility.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352124849.cdcC2.16914
Date: Mon, 5 Nov 2012 14:14:09 +0000
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
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:daveholden2008&#64;fastmail.fm" title="D. Holden &lt;daveholden2008&#64;fastmail.fm&gt;"> <span class="fn">D. Holden</span></a>
</span></b>
        <pre>Same for me, I use a Geforce 4 MX440 and it always worked fine until I tried
the latest Ubuntu/Lubuntu/Xubuntu version. 

The following problems occur:

1. On Ubuntu the Unity panels do now show
2. On Xubuntu (XFCE) it works (quite fast), but the terminal text has the color
of the window below (goes away when moving window). Also, there are other
drawing issues with the panels of the default file manager and so on. However
most applications (like FireFox and Chromium) work as expected
3. On Lubuntu the terminal text is ok, but there are also issues with the file
manager and other LXDE apps
4. All desktop versions seem to have issues with radio-buttons, check-boxes and
so on. The color and brightness are not correct.

Is seems that the speed of the new nouveau driver has increased significantly
on the MX440, but at the cost of (some) compatibility.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352124849.cdcC2.16914--

--===============0743675729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0743675729==--
