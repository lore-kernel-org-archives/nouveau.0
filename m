From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68572] shutdown threshold temperature sometimes
 isn't restored properly after hibernate
Date: Tue, 27 Aug 2013 22:58:23 +0000
Message-ID: <bug-68572-8800-AqHao2R5qv@http.bugs.freedesktop.org/>
References: <bug-68572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153488366=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1153488366==
Content-Type: multipart/alternative; boundary="1377644303.7aeC1.27013"; charset="us-ascii"


--1377644303.7aeC1.27013
Date: Tue, 27 Aug 2013 22:58:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68572

--- Comment #4 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #3)
> I'll write a patch to check a little more the temperature before rebooting
> the computer though.
OK, let me know and I'll give it a go.

> Yeah. Are you aware that Hibernate is not considered as being very stable?
I am using hibernate since kernel 2.6. It was disastrous in all versions up to
3.1, had a few problems in various 3.x kernel versions, but since about 3.7 it
has been rock solid!

> You may want to avoid using it, some people lost their data because of it.
No chance! I am doing a couple of hibernate/restore cycles a day, every day,
and, as I pointed out above, have absolutely no issues with it, particularly in
recent kernels.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377644303.7aeC1.27013
Date: Tue, 27 Aug 2013 22:58:23 +0000
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
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572">bug 68572</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68572#c3">comment #3</a>)
<span class="quote">&gt; I'll write a patch to check a little more the temperature before rebooting
&gt; the computer though.</span >
OK, let me know and I'll give it a go.

<span class="quote">&gt; Yeah. Are you aware that Hibernate is not considered as being very stable?</span >
I am using hibernate since kernel 2.6. It was disastrous in all versions up to
3.1, had a few problems in various 3.x kernel versions, but since about 3.7 it
has been rock solid!

<span class="quote">&gt; You may want to avoid using it, some people lost their data because of it.</span >
No chance! I am doing a couple of hibernate/restore cycles a day, every day,
and, as I pointed out above, have absolutely no issues with it, particularly in
recent kernels.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377644303.7aeC1.27013--

--===============1153488366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1153488366==--
