From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] Hardware freeze after resume from suspend
Date: Sun, 11 Aug 2013 15:25:09 +0000
Message-ID: <bug-67878-8800-sZqs3sHQFo@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0060117965=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0060117965==
Content-Type: multipart/alternative; boundary="1376234709.C5DeD1.15601"; charset="us-ascii"


--1376234709.C5DeD1.15601
Date: Sun, 11 Aug 2013 15:25:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #29 from Ben Gamari <bgamari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
According to the bisection,

4f6029da58ba9204c98e33f4f3737fe085c87a6f is the first bad commit
commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Nov 16 11:54:31 2012 +1000

    drm/nv50-nvc0: switch to common disp impl, removing previous version

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 9daeb0bd5ed3e9b22b53c21fab853bd2e392f6ed
4bdbb1d96e57d3f254affb8812788f04b7474bf7 M    drivers

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376234709.C5DeD1.15601
Date: Sun, 11 Aug 2013 15:25:09 +0000
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
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:bgamari&#64;gmail.com" title="Ben Gamari &lt;bgamari&#64;gmail.com&gt;"> <span class="fn">Ben Gamari</span></a>
</span></b>
        <pre>According to the bisection,

4f6029da58ba9204c98e33f4f3737fe085c87a6f is the first bad commit
commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Nov 16 11:54:31 2012 +1000

    drm/nv50-nvc0: switch to common disp impl, removing previous version

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 9daeb0bd5ed3e9b22b53c21fab853bd2e392f6ed
4bdbb1d96e57d3f254affb8812788f04b7474bf7 M    drivers</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376234709.C5DeD1.15601--

--===============0060117965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0060117965==--
