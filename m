From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77729] [NVE6] Screen freeze then X crash, GTX 660
Date: Mon, 21 Apr 2014 15:01:02 +0000
Message-ID: <bug-77729-8800-ShWseXE5z6@http.bugs.freedesktop.org/>
References: <bug-77729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0561986826=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77729-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0561986826==
Content-Type: multipart/alternative; boundary="1398092461.D0E5bfC71.19298"; charset="us-ascii"


--1398092461.D0E5bfC71.19298
Date: Mon, 21 Apr 2014 15:01:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77729

--- Comment #2 from soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
(In reply to comment #1)
> Can you check if this is the same as bug #72180 ? i.e. do the problems go
> away if using blob pgraph fw?

Yeah it seems so. "Jorden Bass" mentioned "Sometimes, shortly before the
lockup, graphics will become highly corrupted.".
That was my screen yesterday before one of those freezes:
http://i.imgur.com/tV99i7t.jpg
First only the "regular" X clients were weird then the gnome UI got these black
white rectangles too.
Going to try Jorden's firmware files, thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398092461.D0E5bfC71.19298
Date: Mon, 21 Apr 2014 15:01:01 +0000
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
   title="NEW --- - [NVE6] Screen freeze then X crash, GTX 660"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Screen freeze then X crash, GTX 660"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729">bug 77729</a>
              from <span class="vcard"><a class="email" href="mailto:soundx94&#64;hotmail.com" title="soundx94&#64;hotmail.com">soundx94&#64;hotmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77729#c1">comment #1</a>)
<span class="quote">&gt; Can you check if this is the same as <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="show_bug.cgi?id=72180">bug #72180</a> ? i.e. do the problems go
&gt; away if using blob pgraph fw?</span >

Yeah it seems so. &quot;Jorden Bass&quot; mentioned &quot;Sometimes, shortly before the
lockup, graphics will become highly corrupted.&quot;.
That was my screen yesterday before one of those freezes:
<a href="http://i.imgur.com/tV99i7t.jpg">http://i.imgur.com/tV99i7t.jpg</a>
First only the &quot;regular&quot; X clients were weird then the gnome UI got these black
white rectangles too.
Going to try Jorden's firmware files, thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398092461.D0E5bfC71.19298--

--===============0561986826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0561986826==--
