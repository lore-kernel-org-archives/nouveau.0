From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Tue, 07 May 2013 20:51:40 +0000
Message-ID: <bug-57350-8800-G0ymJrgo4r@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973766164=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0973766164==
Content-Type: multipart/alternative; boundary="1367959900.AeE14.14345"; charset="us-ascii"


--1367959900.AeE14.14345
Date: Tue, 7 May 2013 20:51:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

--- Comment #34 from alzeih-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #33)
> 3.9.0 with xf86-video-nouveau-1.0.7, libdrm-2.4.44 and mesa-9.1.2 seems to
> behave properly (no broken cursor and no log spamming).
> 
> Not sure which part of the updates did the trick.
> 
> There is still seldom complaints showing up, e.g. on VT switch. Will attach
> that log later on hopefully with some indication of which action triggers
> which messages.

Ah. Well.

Yes, I'm not getting log spamming or a broken mouse cursor with 3.9 or 3.8.11,
but the corruption on the console (pre X) that started at the same time still
persists. 

Perhaps not the same issue, but I'd be fairly certain it's related closely
somehow. So I guess this ticket can be closed if there's another one open for
the console graphics corruption?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367959900.AeE14.14345
Date: Tue, 7 May 2013 20:51:40 +0000
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:alzeih&#64;gmail.com" title="alzeih&#64;gmail.com">alzeih&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57350#c33">comment #33</a>)
<span class="quote">&gt; 3.9.0 with xf86-video-nouveau-1.0.7, libdrm-2.4.44 and mesa-9.1.2 seems to
&gt; behave properly (no broken cursor and no log spamming).
&gt; 
&gt; Not sure which part of the updates did the trick.
&gt; 
&gt; There is still seldom complaints showing up, e.g. on VT switch. Will attach
&gt; that log later on hopefully with some indication of which action triggers
&gt; which messages.</span >

Ah. Well.

Yes, I'm not getting log spamming or a broken mouse cursor with 3.9 or 3.8.11,
but the corruption on the console (pre X) that started at the same time still
persists. 

Perhaps not the same issue, but I'd be fairly certain it's related closely
somehow. So I guess this ticket can be closed if there's another one open for
the console graphics corruption?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367959900.AeE14.14345--

--===============0973766164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0973766164==--
