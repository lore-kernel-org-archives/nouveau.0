From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Mon, 22 Jul 2013 22:39:53 +0000
Message-ID: <bug-67051-8800-etWOcJMeck@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1672314719=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1672314719==
Content-Type: multipart/alternative; boundary="1374532793.baC5E27a0.17701"; charset="us-ascii"


--1374532793.baC5E27a0.17701
Date: Mon, 22 Jul 2013 22:39:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #65 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 82848
  --> https://bugs.freedesktop.org/attachment.cgi?id=82848&action=edit
dmesg f79

I cranked "log_buf_len" up all the way to 2M.
the noise was so intense it felt like a tornado.
I reassured the neighbors all the racket was from the crowd frenzy over the
Duchess of Cambridge giving birth to a boy.

On a more serious vein (while experiencing the same excitement) I just noticed
that after hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
file 'hdminv84.c' retains the same size, although a quite different content:

[]$ diff hdminv84.c-orig hdminv84.c     

47,48d46
<       nv_wr32(priv, 0x616534 + hoff, 0x00000000);
<       nv_wr32(priv, 0x616538 + hoff, 0x00000000);
54c52
<       nv_wr32(priv, 0x61650c + hoff, 0x00000071);
---
>       nv_wr32(priv, 0x61650c + hoff, 0x00000170);
55a54,55
>       nv_wr32(priv, 0x616514 + hoff, 0x00000000);
>       nv_wr32(priv, 0x616518 + hoff, 0x00000000);
64c64
<       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f007f, data | 0x1f000000 /* ???
*/);
---
>       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f003f, data | 0x1f000000 /* ??? */);

Just checkin'.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374532793.baC5E27a0.17701
Date: Mon, 22 Jul 2013 22:39:53 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c65">Comment # 65</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=82848" name="attach_82848" title="dmesg f79">attachment 82848</a> <a href="attachment.cgi?id=82848&amp;action=edit" title="dmesg f79">[details]</a></span>
dmesg f79

I cranked &quot;log_buf_len&quot; up all the way to 2M.
the noise was so intense it felt like a tornado.
I reassured the neighbors all the racket was from the crowd frenzy over the
Duchess of Cambridge giving birth to a boy.

On a more serious vein (while experiencing the same excitement) I just noticed
that after hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
file 'hdminv84.c' retains the same size, although a quite different content:

[]$ diff hdminv84.c-orig hdminv84.c     

47,48d46
&lt;       nv_wr32(priv, 0x616534 + hoff, 0x00000000);
&lt;       nv_wr32(priv, 0x616538 + hoff, 0x00000000);
54c52
&lt;       nv_wr32(priv, 0x61650c + hoff, 0x00000071);
---
<span class="quote">&gt;       nv_wr32(priv, 0x61650c + hoff, 0x00000170);</span >
55a54,55
<span class="quote">&gt;       nv_wr32(priv, 0x616514 + hoff, 0x00000000);
&gt;       nv_wr32(priv, 0x616518 + hoff, 0x00000000);</span >
64c64
&lt;       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f007f, data | 0x1f000000 /* ???
*/);
---
<span class="quote">&gt;       nv_mask(priv, 0x6165a4 + hoff, 0x5f1f003f, data | 0x1f000000 /* ??? */);</span >

Just checkin'.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374532793.baC5E27a0.17701--

--===============1672314719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1672314719==--
