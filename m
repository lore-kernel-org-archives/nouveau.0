From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Mon, 10 Feb 2014 00:37:04 +0000
Message-ID: <bug-40747-8800-XF0jJGnqLZ@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841837732=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0841837732==
Content-Type: multipart/alternative; boundary="1391992624.5d6B45.18335"; charset="us-ascii"


--1391992624.5d6B45.18335
Date: Mon, 10 Feb 2014 00:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #23 from Robert Hancock <hancockrwd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This RHEL bug report is related:

https://bugzilla.redhat.com/show_bug.cgi?id=681257

The NVIDIA binary driver seems to use reduced-blanking DVI modes by default on
this chipset which allows for 1600x1200 resolution to be usable with
single-link DVI. Nouveau does not do this, which leaves you stuck with a lower
resolution.

The spec sheets for the card in question there (Quadro NVS 285) list that it
supports 1900x1200x60Hz on DVI. The binary driver reports 155 MHz as the
maximum TMDS pixel clock.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391992624.5d6B45.18335
Date: Mon, 10 Feb 2014 00:37:04 +0000
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
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:hancockrwd&#64;gmail.com" title="Robert Hancock &lt;hancockrwd&#64;gmail.com&gt;"> <span class="fn">Robert Hancock</span></a>
</span></b>
        <pre>This RHEL bug report is related:

<a href="https://bugzilla.redhat.com/show_bug.cgi?id=681257">https://bugzilla.redhat.com/show_bug.cgi?id=681257</a>

The NVIDIA binary driver seems to use reduced-blanking DVI modes by default on
this chipset which allows for 1600x1200 resolution to be usable with
single-link DVI. Nouveau does not do this, which leaves you stuck with a lower
resolution.

The spec sheets for the card in question there (Quadro NVS 285) list that it
supports 1900x1200x60Hz on DVI. The binary driver reports 155 MHz as the
maximum TMDS pixel clock.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391992624.5d6B45.18335--

--===============0841837732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0841837732==--
