From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Fri, 26 Jul 2013 18:30:10 +0000
Message-ID: <bug-67315-8800-dbRu7RGoBO@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141519360=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0141519360==
Content-Type: multipart/alternative; boundary="1374863410.61BC52.20678"; charset="us-ascii"


--1374863410.61BC52.20678
Date: Fri, 26 Jul 2013 18:30:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #3)
> 
> There is no xorg.conf file. This is a fresh, virgin install of Fedora
> 19, then updated.
> 

AFAICS I've asked you to try using an xorg.conf, rather than "Are you using one
how?" :P

> 
> I stated that it appears to occur when the screen saver starts and I did
> include the dmesg data that started to spew out when the problem occurs.
> That being said, I will restart everything and disable the screen saver
> completely.
> 

You mentioned "possibly when the screen saver kicks in", which indicates a wild
guess :P With that confirmed which screen saver you're talking about -
bubble3d, etc.

There is a reason I've requested dmesg output, the one you attached is at
rather unknown point with absolutely no information as to how nouveau handles
your card :\. That's why I've mentioned a _complete_ dmesg. If you feel there
is something confidential inside if clearly strip it out

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374863410.61BC52.20678
Date: Fri, 26 Jul 2013 18:30:10 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c3">comment #3</a>)
<span class="quote">&gt; 
&gt; There is no xorg.conf file. This is a fresh, virgin install of Fedora
&gt; 19, then updated.
&gt; </span >

AFAICS I've asked you to try using an xorg.conf, rather than &quot;Are you using one
how?&quot; :P

<span class="quote">&gt; 
&gt; I stated that it appears to occur when the screen saver starts and I did
&gt; include the dmesg data that started to spew out when the problem occurs.
&gt; That being said, I will restart everything and disable the screen saver
&gt; completely.
&gt; </span >

You mentioned &quot;possibly when the screen saver kicks in&quot;, which indicates a wild
guess :P With that confirmed which screen saver you're talking about -
bubble3d, etc.

There is a reason I've requested dmesg output, the one you attached is at
rather unknown point with absolutely no information as to how nouveau handles
your card :\. That's why I've mentioned a _complete_ dmesg. If you feel there
is something confidential inside if clearly strip it out</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374863410.61BC52.20678--

--===============0141519360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0141519360==--
