From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] monitor connected via HDMI->DVI
 adapter is blank / standby (9500GS)
Date: Sun, 25 Aug 2013 05:56:11 +0000
Message-ID: <bug-43939-8800-l9SAZhnsq4@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0540857884=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0540857884==
Content-Type: multipart/alternative; boundary="1377410171.Dbcf13e82.10722"; charset="us-ascii"


--1377410171.Dbcf13e82.10722
Date: Sun, 25 Aug 2013 05:56:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #13 from Anthony Foiani <anthony.foiani+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #12)
> Oh, I'm in no way trying to lay the blame away from nouveau :) 

Heh.  Didn't mean to imply that you were.

Mostly I was convincing myself about whether I need another hour or two of
swapping cables to try HDMI-to-HDMI connection on same card, in case there's
something intrinsically flakey with this card.  (It's actually the GS variant,
which was OEM'd to HP at the time?)

> Just getting
> the facts straight. I assume this is just an adapter (i.e. round hole/square
> peg), not a converter. In this case, the card would actually drive the port
> as a DVI port that just happens to be using a HDMI cable. Which actually
> makes the problem more likely to be unrelated to the one in the other bug.

Yes, these are all pin-to-pin adapters.

(I had to check, because I'm involved with a *different* bug that affects
active DisplayPort to dual-link DVI converters -- but that's on a different
machine, a little ultra small form factor that only has displayport output from
the intel gfx core.)

> For completeness, could you upload your vbios
> (/sys/kernel/debug/dri/0/vbios.rom)?

Will do so.

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377410171.Dbcf13e82.10722
Date: Sun, 25 Aug 2013 05:56:11 +0000
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
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:anthony.foiani+freedesktop&#64;gmail.com" title="Anthony Foiani &lt;anthony.foiani+freedesktop&#64;gmail.com&gt;"> <span class="fn">Anthony Foiani</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=43939#c12">comment #12</a>)
<span class="quote">&gt; Oh, I'm in no way trying to lay the blame away from nouveau :) </span >

Heh.  Didn't mean to imply that you were.

Mostly I was convincing myself about whether I need another hour or two of
swapping cables to try HDMI-to-HDMI connection on same card, in case there's
something intrinsically flakey with this card.  (It's actually the GS variant,
which was OEM'd to HP at the time?)

<span class="quote">&gt; Just getting
&gt; the facts straight. I assume this is just an adapter (i.e. round hole/square
&gt; peg), not a converter. In this case, the card would actually drive the port
&gt; as a DVI port that just happens to be using a HDMI cable. Which actually
&gt; makes the problem more likely to be unrelated to the one in the other bug.</span >

Yes, these are all pin-to-pin adapters.

(I had to check, because I'm involved with a *different* bug that affects
active DisplayPort to dual-link DVI converters -- but that's on a different
machine, a little ultra small form factor that only has displayport output from
the intel gfx core.)

<span class="quote">&gt; For completeness, could you upload your vbios
&gt; (/sys/kernel/debug/dri/0/vbios.rom)?</span >

Will do so.

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377410171.Dbcf13e82.10722--

--===============0540857884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0540857884==--
