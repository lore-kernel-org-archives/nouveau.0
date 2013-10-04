From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Fri, 04 Oct 2013 11:05:31 +0000
Message-ID: <bug-15758-8800-RH7NSIsOus@http.bugs.freedesktop.org/>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0939022377=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0939022377==
Content-Type: multipart/alternative; boundary="1380884732.B0f8Ea76.16148"; charset="us-ascii"


--1380884732.B0f8Ea76.16148
Date: Fri, 4 Oct 2013 11:05:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=15758

--- Comment #33 from ^m'e <marcoep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> I think this is most likely caused by the hardware issue fixed for nv in bug
> 7309. I'm not sure where the fix (delay) should go in nouveau however, since
> simply delaying for a second each time the cursor is turned off is not an
> option, as the hwcursor gets turned on and off many times during normal
> operation.

I recently tried the nv driver on gentoo and it also suffers from the same
problem -- always reproductible: just wait enough with an open X session.
The problem might then well be in xorg itself...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380884732.B0f8Ea76.16148
Date: Fri, 4 Oct 2013 11:05:32 +0000
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
   title="REOPENED --- - Invisible mouse pointer on NV4E (C51)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=15758#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Invisible mouse pointer on NV4E (C51)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=15758">bug 15758</a>
              from <span class="vcard"><a class="email" href="mailto:marcoep&#64;gmail.com" title="^m'e &lt;marcoep&#64;gmail.com&gt;"> <span class="fn">^m'e</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=15758#c1">comment #1</a>)
<span class="quote">&gt; I think this is most likely caused by the hardware issue fixed for nv in bug
&gt; 7309. I'm not sure where the fix (delay) should go in nouveau however, since
&gt; simply delaying for a second each time the cursor is turned off is not an
&gt; option, as the hwcursor gets turned on and off many times during normal
&gt; operation.</span >

I recently tried the nv driver on gentoo and it also suffers from the same
problem -- always reproductible: just wait enough with an open X session.
The problem might then well be in xorg itself...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380884732.B0f8Ea76.16148--

--===============0939022377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0939022377==--
