From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81283] Icons are misrendered when rgb font hinting
 is activated [NV18]
Date: Sun, 13 Jul 2014 15:54:06 +0000
Message-ID: <bug-81283-8800-NOcPjcI9AL@http.bugs.freedesktop.org/>
References: <bug-81283-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1340840975=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81283-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1340840975==
Content-Type: multipart/alternative; boundary="1405266846.7a561.3941"; charset="us-ascii"


--1405266846.7a561.3941
Date: Sun, 13 Jul 2014 15:54:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81283

--- Comment #3 from Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
>  If you're a developer, can you debug this a bit?
Unfourtunately I am not a driver developer, however I can play a bit arround
and see how things change.

> There have been a few reports of things not being drawn on NV1x,
Interesting you mention missing things, because when I go with grayscale
antialising I can see missing text on the desktop icons. I didn't mention it,
because I guess it is really hard to reproduce.

> I wonder if some sort of alpha setting isn't actually supported 
> and so things are being drawn with alpha=0 or something.
However, shouldn't this just affect the glyphs rendered? The blending mode of
the icons doesn't change, so it seems some state is garbled after the glyphs
were rendered, leading to those misrendered icons.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405266846.7a561.3941
Date: Sun, 13 Jul 2014 15:54:06 +0000
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
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283">bug 81283</a>
              from <span class="vcard"><a class="email" href="mailto:linuxhippy&#64;gmail.com" title="Clemens Eisserer &lt;linuxhippy&#64;gmail.com&gt;"> <span class="fn">Clemens Eisserer</span></a>
</span></b>
        <pre><span class="quote">&gt;  If you're a developer, can you debug this a bit?</span >
Unfourtunately I am not a driver developer, however I can play a bit arround
and see how things change.

<span class="quote">&gt; There have been a few reports of things not being drawn on NV1x,</span >
Interesting you mention missing things, because when I go with grayscale
antialising I can see missing text on the desktop icons. I didn't mention it,
because I guess it is really hard to reproduce.

<span class="quote">&gt; I wonder if some sort of alpha setting isn't actually supported 
&gt; and so things are being drawn with alpha=0 or something.</span >
However, shouldn't this just affect the glyphs rendered? The blending mode of
the icons doesn't change, so it seems some state is garbled after the glyphs
were rendered, leading to those misrendered icons.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405266846.7a561.3941--

--===============1340840975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1340840975==--
