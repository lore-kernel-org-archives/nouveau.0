From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Wed, 20 Feb 2013 08:36:27 +0000
Message-ID: <bug-59168-8800-7L0tm5EEkF@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0826910540=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0826910540==
Content-Type: multipart/alternative; boundary="1361349388.A2cFE5.15496"; charset="us-ascii"


--1361349388.A2cFE5.15496
Date: Wed, 20 Feb 2013 08:36:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #20 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
Comment on attachment 75164
  --> https://bugs.freedesktop.org/attachment.cgi?id=75164
dmesg 3.7.9, suspend / resume, garbage/noise NVidia GF106GLM [Quadro 2000M]

I patched the kernel 3.7.9 with the patch recommended by Marcin yesterday and
tried the suspend / resume cycle with the patched kernel. Unfortunatelly, the
garbage is still there and the error messages 

[  100.755954] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[  100.758599] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

keep on repeating until I stop X. One difference though - the error messages
seem to repeat faster now than before the patch..

Any ideas?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361349388.A2cFE5.15496
Date: Wed, 20 Feb 2013 08:36:28 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>Comment on <span class=""><a href="attachment.cgi?id=75164" name="attach_75164" title="dmesg 3.7.9, suspend / resume, garbage/noise NVidia GF106GLM [Quadro 2000M]">attachment 75164</a> <a href="attachment.cgi?id=75164&amp;action=edit" title="dmesg 3.7.9, suspend / resume, garbage/noise NVidia GF106GLM [Quadro 2000M]">[details]</a></span>
dmesg 3.7.9, suspend / resume, garbage/noise NVidia GF106GLM [Quadro 2000M]

I patched the kernel 3.7.9 with the patch recommended by Marcin yesterday and
tried the suspend / resume cycle with the patched kernel. Unfortunatelly, the
garbage is still there and the error messages 

[  100.755954] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[  100.758599] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

keep on repeating until I stop X. One difference though - the error messages
seem to repeat faster now than before the patch..

Any ideas?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361349388.A2cFE5.15496--

--===============0826910540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0826910540==--
