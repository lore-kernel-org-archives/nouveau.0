From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63165] [NVE6] GTX660 GPU lockups on 3D applications
Date: Sun, 25 Aug 2013 07:12:33 +0000
Message-ID: <bug-63165-8800-wT0DeZfMtC@http.bugs.freedesktop.org/>
References: <bug-63165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1508736113=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1508736113==
Content-Type: multipart/alternative; boundary="1377414753.bbc6A4Ce1.25091"; charset="us-ascii"


--1377414753.bbc6A4Ce1.25091
Date: Sun, 25 Aug 2013 07:12:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63165

--- Comment #14 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #13)
> Hi Ilia,
> Yes, I can get it to crash without doing a suspend/resume. The latest kernel
> I tried is 3.10.7, but I will try a 3.11 kernel when I'm able to. For now,
> I'm just living off of Openbox and applications that only use 2D (which
> actually isn't as bad as I thought it'd be).

Linux 3.11 contains many fixes concerning context switching which should fix
your 3D issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377414753.bbc6A4Ce1.25091
Date: Sun, 25 Aug 2013 07:12:33 +0000
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
   title="NEW --- - [NVE6] GTX660 GPU lockups on 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63165#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] GTX660 GPU lockups on 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63165">bug 63165</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=63165#c13">comment #13</a>)
<span class="quote">&gt; Hi Ilia,
&gt; Yes, I can get it to crash without doing a suspend/resume. The latest kernel
&gt; I tried is 3.10.7, but I will try a 3.11 kernel when I'm able to. For now,
&gt; I'm just living off of Openbox and applications that only use 2D (which
&gt; actually isn't as bad as I thought it'd be).</span >

Linux 3.11 contains many fixes concerning context switching which should fix
your 3D issues.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377414753.bbc6A4Ce1.25091--

--===============1508736113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1508736113==--
