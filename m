From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68572] shutdown threshold temperature sometimes
 isn't restored properly after hibernate
Date: Tue, 27 Aug 2013 00:12:46 +0000
Message-ID: <bug-68572-8800-FHYAbTDxpp@http.bugs.freedesktop.org/>
References: <bug-68572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855930491=="
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


--===============0855930491==
Content-Type: multipart/alternative; boundary="1377562366.DCc6174E2.16384"; charset="us-ascii"


--1377562366.DCc6174E2.16384
Date: Tue, 27 Aug 2013 00:12:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68572

--- Comment #3 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #2)
> (In reply to comment #1)
> > The various temperature thresholds just take care of setting the fan (in
> > this case it's saying that your card is at 0C so it can shut the fan down).
> Well, that was really what caused this. The card temperature was NOT 0C, it
> was something like 30C+, so I suspect something went awry during restore.

Exactly, there is a real problem here. The card must not be fully posted!
I'll write a patch to check a little more the temperature before rebooting
the computer though.

> 
> > I think the real issue are the INVALID_CMD's that you see...
> I am no expert in this, hence submitting this bug report. If there is
> anything else you'd like to know just ask.

Yeah. Are you aware that Hibernate is not considered as being very stable?
You may want to avoid using it, some people lost their data because of it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377562366.DCc6174E2.16384
Date: Tue, 27 Aug 2013 00:12:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - shutdown threshold temperature sometimes isn't restored properly after hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68572">bug 68572</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68572#c2">comment #2</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=68572#c1">comment #1</a>)
&gt; &gt; The various temperature thresholds just take care of setting the fan (in
&gt; &gt; this case it's saying that your card is at 0C so it can shut the fan down).
&gt; Well, that was really what caused this. The card temperature was NOT 0C, it
&gt; was something like 30C+, so I suspect something went awry during restore.</span >

Exactly, there is a real problem here. The card must not be fully posted!
I'll write a patch to check a little more the temperature before rebooting
the computer though.

<span class="quote">&gt; 
&gt; &gt; I think the real issue are the INVALID_CMD's that you see...
&gt; I am no expert in this, hence submitting this bug report. If there is
&gt; anything else you'd like to know just ask.</span >

Yeah. Are you aware that Hibernate is not considered as being very stable?
You may want to avoid using it, some people lost their data because of it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377562366.DCc6174E2.16384--

--===============0855930491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0855930491==--
