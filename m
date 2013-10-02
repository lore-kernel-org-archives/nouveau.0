From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Wed, 02 Oct 2013 16:07:25 +0000
Message-ID: <bug-69488-8800-afkkIhx8K9@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0199904804=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0199904804==
Content-Type: multipart/alternative; boundary="1380730045.d87Fa572.27346"; charset="us-ascii"


--1380730045.d87Fa572.27346
Date: Wed, 2 Oct 2013 16:07:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #11 from David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The IORESOURCE_BUSY patch is already on its way to Linus. However, all it does
is suppressing this warning.

Could you describe what exactly the bug is you were seeing? You said it falls
back to "software frame buffer". The log doesn't say anything like this, what
do you mean by that?
Also, how did you detect a GPU lock-up?

If the warning is all you see but everything was working just fine, this bug
can be closed. As the warning says "Your kernel is fine." this isn't serious at
all and shouldn't cause any issues. If you saw any other weird behavior, please
describe what exactly happened (apart from the oops message in the log).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380730045.d87Fa572.27346
Date: Wed, 2 Oct 2013 16:07:25 +0000
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
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:dh.herrmann&#64;gmail.com" title="David Herrmann &lt;dh.herrmann&#64;gmail.com&gt;"> <span class="fn">David Herrmann</span></a>
</span></b>
        <pre>The IORESOURCE_BUSY patch is already on its way to Linus. However, all it does
is suppressing this warning.

Could you describe what exactly the bug is you were seeing? You said it falls
back to &quot;software frame buffer&quot;. The log doesn't say anything like this, what
do you mean by that?
Also, how did you detect a GPU lock-up?

If the warning is all you see but everything was working just fine, this bug
can be closed. As the warning says &quot;Your kernel is fine.&quot; this isn't serious at
all and shouldn't cause any issues. If you saw any other weird behavior, please
describe what exactly happened (apart from the oops message in the log).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380730045.d87Fa572.27346--

--===============0199904804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0199904804==--
