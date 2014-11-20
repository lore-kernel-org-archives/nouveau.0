From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86491] [NVE6] Nouveau crash when shutting down
Date: Thu, 20 Nov 2014 15:24:57 +0000
Message-ID: <bug-86491-8800-EL9uPgjWTa@http.bugs.freedesktop.org/>
References: <bug-86491-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1058267982=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86491-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1058267982==
Content-Type: multipart/alternative; boundary="1416497097.e20A02.1678"; charset="UTF-8"


--1416497097.e20A02.1678
Date: Thu, 20 Nov 2014 15:24:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86491

--- Comment #5 from Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> (In reply to Jarl E. Gjessing from comment #2)
> > I fully respect that not all issues are critical etc. (we all think it is in
> > our own eyes)
> > But when the machines renders dead on shutdown, I think it is a critical
> > issue?
> > Or at least thats just what I feel.
> 
> Yeah, so if you have a real support organization backing a bugtracker, these
> things have meaning. When you have 1 or 2 people looking at bugs, markers
> like "critical" are more annoying than useful, amusingly enough making it
> _harder_ to see things since they become irregular on the giant
> mega-bug-list.
> 
> Having separate importance and severity markers is also incredibly
> confusing. In any case, at this point, this is an issue that affects just
> you, as far as we know, so unless your thing is literally going up in smoke,
> there's nothing that can be going on that makes it critical -- I think of
> critical as like "affects 75%+ of nouveau user base".

This is getting off-topic and a typical bikeshedding, so let's stop it :)

But here, I just give an example how these two fields work on SUSE bugzilla:
These two fiedls are seen as "priority" and "severity".  The former is the
field where only developer or manager touches as the priority of the task,
while the latter describes how severe the bug itself.  They can be totally
decopuled; for example, in this bug, the severity can be critical as a system
crashes, but its priotiy can be low as it hits only few people.

Of course, the usage of such fields pretty depends and is free for other
interpretation.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416497097.e20A02.1678
Date: Thu, 20 Nov 2014 15:24:57 +0000
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
   title="NEW - [NVE6] Nouveau crash when shutting down"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86491#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Nouveau crash when shutting down"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86491">bug 86491</a>
              from <span class="vcard"><a class="email" href="mailto:tiwai&#64;suse.de" title="Takashi Iwai &lt;tiwai&#64;suse.de&gt;"> <span class="fn">Takashi Iwai</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86491#c3">comment #3</a>)
<span class="quote">&gt; (In reply to Jarl E. Gjessing from <a href="show_bug.cgi?id=86491#c2">comment #2</a>)
&gt; &gt; I fully respect that not all issues are critical etc. (we all think it is in
&gt; &gt; our own eyes)
&gt; &gt; But when the machines renders dead on shutdown, I think it is a critical
&gt; &gt; issue?
&gt; &gt; Or at least thats just what I feel.
&gt; 
&gt; Yeah, so if you have a real support organization backing a bugtracker, these
&gt; things have meaning. When you have 1 or 2 people looking at bugs, markers
&gt; like &quot;critical&quot; are more annoying than useful, amusingly enough making it
&gt; _harder_ to see things since they become irregular on the giant
&gt; mega-bug-list.
&gt; 
&gt; Having separate importance and severity markers is also incredibly
&gt; confusing. In any case, at this point, this is an issue that affects just
&gt; you, as far as we know, so unless your thing is literally going up in smoke,
&gt; there's nothing that can be going on that makes it critical -- I think of
&gt; critical as like &quot;affects 75%+ of nouveau user base&quot;.</span >

This is getting off-topic and a typical bikeshedding, so let's stop it :)

But here, I just give an example how these two fields work on SUSE bugzilla:
These two fiedls are seen as &quot;priority&quot; and &quot;severity&quot;.  The former is the
field where only developer or manager touches as the priority of the task,
while the latter describes how severe the bug itself.  They can be totally
decopuled; for example, in this bug, the severity can be critical as a system
crashes, but its priotiy can be low as it hits only few people.

Of course, the usage of such fields pretty depends and is free for other
interpretation.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416497097.e20A02.1678--

--===============1058267982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1058267982==--
