From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62835] Screen freezes after resume from s2ram
Date: Sat, 05 Oct 2013 06:26:50 +0000
Message-ID: <bug-62835-8800-iZTlRkzGuZ@http.bugs.freedesktop.org/>
References: <bug-62835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1133219659=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1133219659==
Content-Type: multipart/alternative; boundary="1380954410.ACe63.20776"; charset="us-ascii"


--1380954410.ACe63.20776
Date: Sat, 5 Oct 2013 06:26:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62835

--- Comment #7 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> 
> Regarding suspend/resume scrambling screen issues, try this patch:
> 
> 
> [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
> 
> http://lists.freedesktop.org/archives/nouveau/2013-October/014656.html
> 

Hi,

I tried your patch but it does not solve my issue :(

//Pontus

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380954410.ACe63.20776
Date: Sat, 5 Oct 2013 06:26:50 +0000
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
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen freezes after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62835">bug 62835</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=62835#c6">comment #6</a>)
<span class="quote">&gt; 
&gt; Regarding suspend/resume scrambling screen issues, try this patch:
&gt; 
&gt; 
&gt; [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
&gt; 
&gt; <a href="http://lists.freedesktop.org/archives/nouveau/2013-October/014656.html">http://lists.freedesktop.org/archives/nouveau/2013-October/014656.html</a>
&gt; </span >

Hi,

I tried your patch but it does not solve my issue :(

//Pontus</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380954410.ACe63.20776--

--===============1133219659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1133219659==--
