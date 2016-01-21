From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28M)
Date: Thu, 21 Jan 2016 12:29:48 +0000
Message-ID: <bug-54700-8800-ttotVeCqPX@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1578736341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1578736341==
Content-Type: multipart/alternative; boundary="14533793890.AA5A9.5700";
 charset="UTF-8"


--14533793890.AA5A9.5700
Date: Thu, 21 Jan 2016 12:29:49 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #74 from AndrewK <kurn-z1KUqvL5UUQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #64)
> (In reply to comment #63)

> > 
> > Option 3 could definately tell if it's only used for a particular memory
> > configuration of this chip, or it's more general (e.g. first 2 options).
> 
> I've fired off a question to NVIDIA, hopefully they'll respond. Sometimes
> they respond ~immediately, other times it takes two months, but so far they
> haven't dropped anything on the floor.


Well, now that it's more than a year, I think the floor can be considered the
likely destination.  It would be nice to have an answer, but it's no longer
likely.

I think a fall-back to #2 (set the bit for N28 chips) is the most reasonable.
If all the other chips needed it, we'd have seen a flood of bug reports by now.
 It's not as if this bug isn't obvious.  X is unusable until it's fixed.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533793890.AA5A9.5700
Date: Thu, 21 Jan 2016 12:29:49 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c74">Comment # 74</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:kurn&#64;sfu.ca" title="AndrewK &lt;kurn&#64;sfu.ca&gt;"> <span class="fn">AndrewK</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=54700#c64">comment #64</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=54700#c63">comment #63</a>)</span >

<span class="quote">&gt; &gt; 
&gt; &gt; Option 3 could definately tell if it's only used for a particular memory
&gt; &gt; configuration of this chip, or it's more general (e.g. first 2 options).
&gt; 
&gt; I've fired off a question to NVIDIA, hopefully they'll respond. Sometimes
&gt; they respond ~immediately, other times it takes two months, but so far they
&gt; haven't dropped anything on the floor.</span >


Well, now that it's more than a year, I think the floor can be considered the
likely destination.  It would be nice to have an answer, but it's no longer
likely.

I think a fall-back to #2 (set the bit for N28 chips) is the most reasonable.
If all the other chips needed it, we'd have seen a flood of bug reports by now.
 It's not as if this bug isn't obvious.  X is unusable until it's fixed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533793890.AA5A9.5700--

--===============1578736341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1578736341==--
