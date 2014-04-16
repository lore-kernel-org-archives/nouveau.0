From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57034] [NVA0] second dp monitor stays powered off
Date: Wed, 16 Apr 2014 15:08:17 +0000
Message-ID: <bug-57034-8800-Myj6E5hK88@http.bugs.freedesktop.org/>
References: <bug-57034-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0046675816=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57034-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0046675816==
Content-Type: multipart/alternative; boundary="1397660896.08711.24439"; charset="us-ascii"


--1397660896.08711.24439
Date: Wed, 16 Apr 2014 15:08:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57034

--- Comment #15 from Orion Poplawski <orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org> ---
Now with 3.13 kernels, the DP-1 monitor is in power save on boot.  Restarting X
doesn't help anymore.  xrandr reports it as active though.  Need to disable and
re-enable to get it to come on.  
kernel-3.13.10-200.fc20.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397660896.08711.24439
Date: Wed, 16 Apr 2014 15:08:16 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NVA0] second dp monitor stays powered off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVA0] second dp monitor stays powered off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034">bug 57034</a>
              from <span class="vcard"><a class="email" href="mailto:orion&#64;cora.nwra.com" title="Orion Poplawski &lt;orion&#64;cora.nwra.com&gt;"> <span class="fn">Orion Poplawski</span></a>
</span></b>
        <pre>Now with 3.13 kernels, the DP-1 monitor is in power save on boot.  Restarting X
doesn't help anymore.  xrandr reports it as active though.  Need to disable and
re-enable to get it to come on.  
kernel-3.13.10-200.fc20.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397660896.08711.24439--

--===============0046675816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0046675816==--
