From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sun, 08 Sep 2013 17:10:19 +0000
Message-ID: <bug-21273-8800-jHHXAmPgdE@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0634635606=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0634635606==
Content-Type: multipart/alternative; boundary="1378660218.AA501.14042"; charset="us-ascii"


--1378660218.AA501.14042
Date: Sun, 8 Sep 2013 17:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #90 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Very interesting. Note the

[   22.983172] nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo ef220600

That means _something_ is working. I assume 1600x1200 is your monitor's
preferred resolution. What happens if you boot with the kernel command line
options "drm.debug=0xe nouveau.debug=debug"? That should provide a bunch more
info.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378660218.AA501.14042
Date: Sun, 8 Sep 2013 17:10:18 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c90">Comment # 90</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Very interesting. Note the

[   22.983172] nouveau  [     DRM] allocated 1600x1200 fb: 0x9000, bo ef220600

That means _something_ is working. I assume 1600x1200 is your monitor's
preferred resolution. What happens if you boot with the kernel command line
options &quot;drm.debug=0xe nouveau.debug=debug&quot;? That should provide a bunch more
info.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378660218.AA501.14042--

--===============0634635606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0634635606==--
