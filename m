From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Mon, 10 Feb 2014 06:55:33 +0000
Message-ID: <bug-73744-8800-HwfGIwdsne@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058377103=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73744-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2058377103==
Content-Type: multipart/alternative; boundary="1392015333.742EAd81.10919"; charset="us-ascii"


--1392015333.742EAd81.10919
Date: Mon, 10 Feb 2014 06:55:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #13)
> Created attachment 93667 [details]
> Log file with segfault in it
> 
> Not sure if this info for Xorg is helpful to the Nouveau folks but, shit,
> it's something.

Nope, that's just a crash that happens when the GPU locks up. The DDX isn't
very good at handling that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392015333.742EAd81.10919
Date: Mon, 10 Feb 2014 06:55:33 +0000
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
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73744#c13">comment #13</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=93667" name="attach_93667" title="Log file with segfault in it">attachment 93667</a> <a href="attachment.cgi?id=93667&amp;action=edit" title="Log file with segfault in it">[details]</a></span>
&gt; Log file with segfault in it
&gt; 
&gt; Not sure if this info for Xorg is helpful to the Nouveau folks but, shit,
&gt; it's something.</span >

Nope, that's just a crash that happens when the GPU locks up. The DDX isn't
very good at handling that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392015333.742EAd81.10919--

--===============2058377103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2058377103==--
