From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72181] [v3.13][regression] NULL pointer deref
 (_nouveau_clock_init)
Date: Sun, 01 Dec 2013 21:15:19 +0000
Message-ID: <bug-72181-8800-5yZGVFEbqC@http.bugs.freedesktop.org/>
References: <bug-72181-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1104704424=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72181-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1104704424==
Content-Type: multipart/alternative; boundary="1385932519.E427FaFf2.12340"; charset="us-ascii"


--1385932519.E427FaFf2.12340
Date: Sun, 1 Dec 2013 21:15:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72181

--- Comment #3 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> Thank you, xexaxo already suggested that patch on IRC. This fixed the bug.
> Too bad it's not upstream yet :/ .
Technically, Linus's tree is downstream :P But, I'll be sending a fixes tree
during the week. 

Ben.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385932519.E427FaFf2.12340
Date: Sun, 1 Dec 2013 21:15:18 +0000
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
   title="NEW --- - [v3.13][regression] NULL pointer deref (_nouveau_clock_init)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72181#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [v3.13][regression] NULL pointer deref (_nouveau_clock_init)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72181">bug 72181</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72181#c2">comment #2</a>)
<span class="quote">&gt; Thank you, xexaxo already suggested that patch on IRC. This fixed the bug.
&gt; Too bad it's not upstream yet :/ .</span >
Technically, Linus's tree is downstream :P But, I'll be sending a fixes tree
during the week. 

Ben.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385932519.E427FaFf2.12340--

--===============1104704424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1104704424==--
