From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75203] [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660
 - Strange pink line on left screen side
Date: Tue, 16 Sep 2014 06:38:05 +0000
Message-ID: <bug-75203-8800-FetJxnrUrL@http.bugs.freedesktop.org/>
References: <bug-75203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1560530348=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1560530348==
Content-Type: multipart/alternative; boundary="1410849485.B66b03.18591"; charset="us-ascii"


--1410849485.B66b03.18591
Date: Tue, 16 Sep 2014 06:38:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75203

--- Comment #15 from Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #14)
> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.
> 18&id=a522946174b5ae389af0856c422d865a63c70316
> 
> Please test & confirm.

I built & ran, but I hit a panic - which may not be related to nouveau: I
booted with blob and got a panic ending with "recursion stopped but you need to
reboot" or so message.
With nouveau it booted just a past nouveau initialisation before panic'ing
again (I had the time to see at least 3 panic/oops messages scroll by, like
500ms from each other), so I could at least see the HDMI initialising properly
on HDMI-1 in console. I didn't test other outputs, HDMI audio, and different
resolution.
I'll be away for 3 weeks starting tomorrow, so sadly I won't have much time to
test further until then.

BTW, isn't "ret" returned uninitialised in the "else" branch of
"if(nvif_unpack(args->v0, 0, 0, false))" ? Or is there some macro magic ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410849485.B66b03.18591
Date: Tue, 16 Sep 2014 06:38:05 +0000
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
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203">bug 75203</a>
              from <span class="vcard"><a class="email" href="mailto:plr.vincent&#64;gmail.com" title="Vincent Pelletier &lt;plr.vincent&#64;gmail.com&gt;"> <span class="fn">Vincent Pelletier</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75203#c14">comment #14</a>)
<span class="quote">&gt; <a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3</a>.
&gt; 18&amp;id=a522946174b5ae389af0856c422d865a63c70316
&gt; 
&gt; Please test &amp; confirm.</span >

I built &amp; ran, but I hit a panic - which may not be related to nouveau: I
booted with blob and got a panic ending with &quot;recursion stopped but you need to
reboot&quot; or so message.
With nouveau it booted just a past nouveau initialisation before panic'ing
again (I had the time to see at least 3 panic/oops messages scroll by, like
500ms from each other), so I could at least see the HDMI initialising properly
on HDMI-1 in console. I didn't test other outputs, HDMI audio, and different
resolution.
I'll be away for 3 weeks starting tomorrow, so sadly I won't have much time to
test further until then.

BTW, isn't &quot;ret&quot; returned uninitialised in the &quot;else&quot; branch of
&quot;if(nvif_unpack(args-&gt;v0, 0, 0, false))&quot; ? Or is there some macro magic ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410849485.B66b03.18591--

--===============1560530348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1560530348==--
