From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Tue, 19 Feb 2013 08:55:27 +0000
Message-ID: <bug-50121-8800-KBj3Erzxcs@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0334922997=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0334922997==
Content-Type: multipart/alternative; boundary="1361264127.d1c8fe66.29352"; charset="us-ascii"


--1361264127.d1c8fe66.29352
Date: Tue, 19 Feb 2013 08:55:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #65 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to comment #44)
I am experiencing the same problem on my w520 with Nvidia GF106 [Quadro
2000M].. I get the same symptoms / messages. Did you find a fix for the
problem?

I noticed that suspend / resume works if using libdrm-nouveau1a only (without
libdrm-nouveau2), however I the mouse gets lost on resume. If using
libdrm-nouveau2, I get the problems.. Maybe the problem is somehow related to
dri2?

> Am I still in the scope of this bug with the following endlessly repeating
> errors on resume? (Which will go away if killing X.)
> 
> [ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
> Xorg[1009]]
> [ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361264127.d1c8fe66.29352
Date: Tue, 19 Feb 2013 08:55:27 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c65">Comment # 65</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c44">comment #44</a>)
I am experiencing the same problem on my w520 with Nvidia GF106 [Quadro
2000M].. I get the same symptoms / messages. Did you find a fix for the
problem?

I noticed that suspend / resume works if using libdrm-nouveau1a only (without
libdrm-nouveau2), however I the mouse gets lost on resume. If using
libdrm-nouveau2, I get the problems.. Maybe the problem is somehow related to
dri2?

<span class="quote">&gt; Am I still in the scope of this bug with the following endlessly repeating
&gt; errors on resume? (Which will go away if killing X.)
&gt; 
&gt; [ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
&gt; Xorg[1009]]
&gt; [ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361264127.d1c8fe66.29352--

--===============0334922997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0334922997==--
