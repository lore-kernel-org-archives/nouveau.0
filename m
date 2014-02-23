From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sun, 23 Feb 2014 22:15:21 +0000
Message-ID: <bug-75279-8800-0XB53jUEnh@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0068439727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0068439727==
Content-Type: multipart/alternative; boundary="1393193721.Cc742.32234"; charset="us-ascii"


--1393193721.Cc742.32234
Date: Sun, 23 Feb 2014 22:15:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #15 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #14)
> Frederic, would you be able to use top to identify the program using 100%
> cpu, attach a debugger (gdb attach <pid>) while hanging, and get a stack
> trace, please?

Already done in mozilla bugzilla bug report.

Adding this log here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393193721.Cc742.32234
Date: Sun, 23 Feb 2014 22:15:21 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75279#c14">comment #14</a>)
<span class="quote">&gt; Frederic, would you be able to use top to identify the program using 100%
&gt; cpu, attach a debugger (gdb attach &lt;pid&gt;) while hanging, and get a stack
&gt; trace, please?</span >

Already done in mozilla bugzilla bug report.

Adding this log here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393193721.Cc742.32234--

--===============0068439727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0068439727==--
