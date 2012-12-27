From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Thu, 27 Dec 2012 19:53:57 +0000
Message-ID: <bug-31122-8800-ZUmLt8E2Fp@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0892298308=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0892298308==
Content-Type: multipart/alternative; boundary="1356638037.FbDf3.4453"; charset="us-ascii"


--1356638037.FbDf3.4453
Date: Thu, 27 Dec 2012 19:53:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31122

--- Comment #4 from Danny <moondrake-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The powerpc platform has become so old that most current developers do no
longer care (and most maintainers have no clue about it...).

There is no ACPI on powerpc, so that will not help you.

About 3-4 years ago nouveau was working reasonable on powerbooks, since then it
has gotten more love from hard-working (paid) RH devs, who's priorities are
different than from some of the original group. Not to discredit their work,
they come a long way since the original, but much of the newer work breaks the
weird powerpc platform.

The harddisk of my own model also broke so I also stopped testing things on
powerpc. 

Backlight and dpms on powerpc is done via some registers on the card. You can
write directly to them (via radeontool) or make a special driver for it (a
patch was posted on lkml, but here is some more recent info about it:
http://mac.linux.be/phpBB3/viewtopic.php?f=11&t=365).

I remember abstracting the similar code in a separate kernel module which still
sits on my powerbook harddisk (it also contained patches against the then
current nouveau to make the machine wake from sleep and restore the screen.
Perhaps I will get time someday to see how much of that can be salvaged and
used with modern kernels, but still there probably only 5 people left that are
interested, it has not much priority...).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356638037.FbDf3.4453
Date: Thu, 27 Dec 2012 19:53:57 +0000
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
   title="NEW --- - Cannot control backlight intensity on Powerbook"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31122#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot control backlight intensity on Powerbook"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31122">bug 31122</a>
              from <span class="vcard"><a class="email" href="mailto:moondrake&#64;gmail.com" title="Danny &lt;moondrake&#64;gmail.com&gt;"> <span class="fn">Danny</span></a>
</span></b>
        <pre>The powerpc platform has become so old that most current developers do no
longer care (and most maintainers have no clue about it...).

There is no ACPI on powerpc, so that will not help you.

About 3-4 years ago nouveau was working reasonable on powerbooks, since then it
has gotten more love from hard-working (paid) RH devs, who's priorities are
different than from some of the original group. Not to discredit their work,
they come a long way since the original, but much of the newer work breaks the
weird powerpc platform.

The harddisk of my own model also broke so I also stopped testing things on
powerpc. 

Backlight and dpms on powerpc is done via some registers on the card. You can
write directly to them (via radeontool) or make a special driver for it (a
patch was posted on lkml, but here is some more recent info about it:
<a href="http://mac.linux.be/phpBB3/viewtopic.php?f=11&amp;t=365">http://mac.linux.be/phpBB3/viewtopic.php?f=11&amp;t=365</a>).

I remember abstracting the similar code in a separate kernel module which still
sits on my powerbook harddisk (it also contained patches against the then
current nouveau to make the machine wake from sleep and restore the screen.
Perhaps I will get time someday to see how much of that can be salvaged and
used with modern kernels, but still there probably only 5 people left that are
interested, it has not much priority...).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356638037.FbDf3.4453--

--===============0892298308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0892298308==--
