From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Tue, 19 Feb 2013 09:12:09 +0000
Message-ID: <bug-50121-8800-CHqO8vsbTX@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1861648242=="
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


--===============1861648242==
Content-Type: multipart/alternative; boundary="1361265129.2E5AE6.1192"; charset="us-ascii"


--1361265129.2E5AE6.1192
Date: Tue, 19 Feb 2013 09:12:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #66 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #65)
> (In reply to comment #44)
> I am experiencing the same problem on my w520 with Nvidia GF106 [Quadro
> 2000M].. I get the same symptoms / messages. Did you find a fix for the
> problem?
> 
> I noticed that suspend / resume works if using libdrm-nouveau1a only
> (without libdrm-nouveau2), however I the mouse gets lost on resume. If using
> libdrm-nouveau2, I get the problems.. Maybe the problem is somehow related
> to dri2?
> 
> > Am I still in the scope of this bug with the following endlessly repeating
> > errors on resume? (Which will go away if killing X.)
> > 
> > [ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
> > Xorg[1009]]
> > [ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

Very interessting comments. Please attach this info again to bug 59168 where
the W520 lovers hang around regarding this issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361265129.2E5AE6.1192
Date: Tue, 19 Feb 2013 09:12:09 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c66">Comment # 66</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c65">comment #65</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=50121#c44">comment #44</a>)
&gt; I am experiencing the same problem on my w520 with Nvidia GF106 [Quadro
&gt; 2000M].. I get the same symptoms / messages. Did you find a fix for the
&gt; problem?
&gt; 
&gt; I noticed that suspend / resume works if using libdrm-nouveau1a only
&gt; (without libdrm-nouveau2), however I the mouse gets lost on resume. If using
&gt; libdrm-nouveau2, I get the problems.. Maybe the problem is somehow related
&gt; to dri2?
&gt; 
&gt; &gt; Am I still in the scope of this bug with the following endlessly repeating
&gt; &gt; errors on resume? (Which will go away if killing X.)
&gt; &gt; 
&gt; &gt; [ 1623.833303] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fe00000
&gt; &gt; Xorg[1009]]
&gt; &gt; [ 1623.833311] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e</span >

Very interessting comments. Please attach this info again to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="show_bug.cgi?id=59168">bug 59168</a> where
the W520 lovers hang around regarding this issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361265129.2E5AE6.1192--

--===============1861648242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1861648242==--
