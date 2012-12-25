From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Tue, 25 Dec 2012 20:07:18 +0000
Message-ID: <bug-50121-8800-idaV5Wh3kN@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247242659=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1247242659==
Content-Type: multipart/alternative; boundary="1356466038.DE831D3.17426"; charset="us-ascii"


--1356466038.DE831D3.17426
Date: Tue, 25 Dec 2012 20:07:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #37 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Reverted the old patch and applied the new one. Did this on the same
v3.8rc1+nouveau kernel tree. It only rebuilded the nouveau specific files.

The FX5200 survived 4 consecutive cycles with this patch. It seems to exhibit
the same behaviour as the previous patch: During suspend and resume, for a
short moment, there is a blue/green stray pixel in the top left corner.
Everything works fine though.

Good to go if you ask me. Maybe apply it to 3.5 and 3.6 as well??

As for the other cards I mentioned (NV4E + NV4B) I merely referenced them to
test the patch against regressions. Suspend is broken on NV4B since KMS became
mandatory. And it seems to work somewhat on NV4E.

*My primary aim is to guard against regressions.* FWIW, do you really want
seperate bugs for the NV4E and NV4B??? They are just bugs, not regressions.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356466038.DE831D3.17426
Date: Tue, 25 Dec 2012 20:07:18 +0000
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
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Reverted the old patch and applied the new one. Did this on the same
v3.8rc1+nouveau kernel tree. It only rebuilded the nouveau specific files.

The FX5200 survived 4 consecutive cycles with this patch. It seems to exhibit
the same behaviour as the previous patch: During suspend and resume, for a
short moment, there is a blue/green stray pixel in the top left corner.
Everything works fine though.

Good to go if you ask me. Maybe apply it to 3.5 and 3.6 as well??

As for the other cards I mentioned (NV4E + NV4B) I merely referenced them to
test the patch against regressions. Suspend is broken on NV4B since KMS became
mandatory. And it seems to work somewhat on NV4E.

*My primary aim is to guard against regressions.* FWIW, do you really want
seperate bugs for the NV4E and NV4B??? They are just bugs, not regressions.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356466038.DE831D3.17426--

--===============1247242659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1247242659==--
