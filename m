From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55450] [NV17] nouveau driver fails to restore screen
 content / video mode after resume from s2ram
Date: Wed, 16 Oct 2013 18:56:07 +0000
Message-ID: <bug-55450-8800-x4pXyFkYcX@http.bugs.freedesktop.org/>
References: <bug-55450-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454676447=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55450-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1454676447==
Content-Type: multipart/alternative; boundary="1381949767.FAB72.23747"; charset="us-ascii"


--1381949767.FAB72.23747
Date: Wed, 16 Oct 2013 18:56:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55450

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On 16/10/13 19:48, Elmar Stellnberger wrote:
> blacklist nouveau?
> I have already "destroyed" my system; yet nouveau still gets laoded:
> modprobe.blacklist=nouveau did not work
> enter "blacklist nouveau" in /etc/modprobe.d/50-blacklist did also not work
> finally renaming noveau.ko to nouveau.ko.bak did not ban the module from
> being loaded either
> 
> so why does all of that d.d. not work?
> can you tell me on what to do?

Without being rude,
1. checked for typos ? I make dozens every day :)
2. igoogleit ? this is the first case that I've heard that one cannot blacklist
nouveau(a module in general). I'm assuming that your distro may be handling
things in a different(unortodox) manner, thus your frustration

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381949767.FAB72.23747
Date: Wed, 16 Oct 2013 18:56:07 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450">bug 55450</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>On 16/10/13 19:48, Elmar Stellnberger wrote:
<span class="quote">&gt; blacklist nouveau?
&gt; I have already &quot;destroyed&quot; my system; yet nouveau still gets laoded:
&gt; modprobe.blacklist=nouveau did not work
&gt; enter &quot;blacklist nouveau&quot; in /etc/modprobe.d/50-blacklist did also not work
&gt; finally renaming noveau.ko to nouveau.ko.bak did not ban the module from
&gt; being loaded either
&gt; 
&gt; so why does all of that d.d. not work?
&gt; can you tell me on what to do?</span >

Without being rude,
1. checked for typos ? I make dozens every day :)
2. igoogleit ? this is the first case that I've heard that one cannot blacklist
nouveau(a module in general). I'm assuming that your distro may be handling
things in a different(unortodox) manner, thus your frustration</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381949767.FAB72.23747--

--===============1454676447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1454676447==--
