From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Tue, 19 Feb 2013 00:32:19 +0000
Message-ID: <bug-60772-8800-BNiOLgb5fj@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0340339048=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0340339048==
Content-Type: multipart/alternative; boundary="1361233939.67f5fB8D1.10739"; charset="us-ascii"


--1361233939.67f5fB8D1.10739
Date: Tue, 19 Feb 2013 00:32:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #8 from Dave Airlie <airlied-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
having the X server load the module isn't supported, I don't care if it ever
worked before. Its racy and horrible. The way Linux works if you have a driver
the kernel is responsible for loading it, the X server isn't.

Add nouveau to /etc/modules.conf

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361233939.67f5fB8D1.10739
Date: Tue, 19 Feb 2013 00:32:19 +0000
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
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:airlied&#64;freedesktop.org" title="Dave Airlie &lt;airlied&#64;freedesktop.org&gt;"> <span class="fn">Dave Airlie</span></a>
</span></b>
        <pre>having the X server load the module isn't supported, I don't care if it ever
worked before. Its racy and horrible. The way Linux works if you have a driver
the kernel is responsible for loading it, the X server isn't.

Add nouveau to /etc/modules.conf</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361233939.67f5fB8D1.10739--

--===============0340339048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0340339048==--
