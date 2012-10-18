From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48434] [NV43] X freezes with "EQ overflowing"
Date: Thu, 18 Oct 2012 17:39:56 +0000
Message-ID: <bug-48434-8800-euQY0CqwZr@http.bugs.freedesktop.org/>
References: <bug-48434-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1600634642=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48434-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1600634642==
Content-Type: multipart/alternative; boundary="1350581996.bc6b6bB2.634"; charset="us-ascii"


--1350581996.bc6b6bB2.634
Date: Thu, 18 Oct 2012 17:39:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48434

--- Comment #10 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Please attach part of kernel log from boot to start of these INVALID_STATE
errors. 

(X crashed -> fbcon started to do image blits -> hw complained about them in
form of these INVALID_STATE errors, which means something else should be before
them)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350581996.bc6b6bB2.634
Date: Thu, 18 Oct 2012 17:39:56 +0000
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
   title="REOPENED --- - [NV43] X freezes with &quot;EQ overflowing&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48434#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV43] X freezes with &quot;EQ overflowing&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48434">bug 48434</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Please attach part of kernel log from boot to start of these INVALID_STATE
errors. 

(X crashed -&gt; fbcon started to do image blits -&gt; hw complained about them in
form of these INVALID_STATE errors, which means something else should be before
them)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350581996.bc6b6bB2.634--

--===============1600634642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1600634642==--
