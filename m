From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58305] Kernel crashes if nVidia card is powered off
 and X restartted
Date: Fri, 13 Sep 2013 06:54:10 +0000
Message-ID: <bug-58305-8800-QmDS5Uwdce@http.bugs.freedesktop.org/>
References: <bug-58305-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1405229200=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58305-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1405229200==
Content-Type: multipart/alternative; boundary="1379055250.ebA478e1.32636"; charset="us-ascii"


--1379055250.ebA478e1.32636
Date: Fri, 13 Sep 2013 06:54:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58305

--- Comment #8 from Dimitar Kosev <buboleck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> Can you confirm that this issue still exists in the latest kernel
> (3.11-rc7)? A bunch of locking/ordering stuff has been redone since 3.8, I
> think.

I just tested with 3.11 and I can can confirm that suspend/resume works,
however still crashes on shut down/reboot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379055250.ebA478e1.32636
Date: Fri, 13 Sep 2013 06:54:10 +0000
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
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305">bug 58305</a>
              from <span class="vcard"><a class="email" href="mailto:buboleck&#64;gmail.com" title="Dimitar Kosev &lt;buboleck&#64;gmail.com&gt;"> <span class="fn">Dimitar Kosev</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58305#c7">comment #7</a>)
<span class="quote">&gt; Can you confirm that this issue still exists in the latest kernel
&gt; (3.11-rc7)? A bunch of locking/ordering stuff has been redone since 3.8, I
&gt; think.</span >

I just tested with 3.11 and I can can confirm that suspend/resume works,
however still crashes on shut down/reboot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379055250.ebA478e1.32636--

--===============1405229200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1405229200==--
