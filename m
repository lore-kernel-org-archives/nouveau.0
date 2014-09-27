From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] Nouveau: corrupted laptop screen's EDID info
Date: Sat, 27 Sep 2014 12:34:12 +0000
Message-ID: <bug-73267-8800-J2a9VkHFjs@http.bugs.freedesktop.org/>
References: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130037867=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0130037867==
Content-Type: multipart/alternative; boundary="1411821251.A8362.14619"; charset="us-ascii"


--1411821251.A8362.14619
Date: Sat, 27 Sep 2014 12:34:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

--- Comment #6 from pjv <ezelspinguin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi chr[],

You were able to fix it again? Good. I myself did not see it again (9 months
have passed), so it's good to know at least you're fixing it for a long while.

Of course I can't really answer your question; I clearly was expert-for-a-day
only. Nice find with usleep. I can follow your reasoning about it being a
timing issue. Is there a better place to submit a bug to "edid_tool write" in
particular?

Best regards,

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411821251.A8362.14619
Date: Sat, 27 Sep 2014 12:34:11 +0000
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
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
              from <span class="vcard"><a class="email" href="mailto:ezelspinguin&#64;gmail.com" title="pjv &lt;ezelspinguin&#64;gmail.com&gt;"> <span class="fn">pjv</span></a>
</span></b>
        <pre>Hi chr[],

You were able to fix it again? Good. I myself did not see it again (9 months
have passed), so it's good to know at least you're fixing it for a long while.

Of course I can't really answer your question; I clearly was expert-for-a-day
only. Nice find with usleep. I can follow your reasoning about it being a
timing issue. Is there a better place to submit a bug to &quot;edid_tool write&quot; in
particular?

Best regards,</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411821251.A8362.14619--

--===============0130037867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0130037867==--
