From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94757] powerpc64 & 64Kb kernel pagesize not working
 with nouveau
Date: Wed, 30 Mar 2016 14:53:10 +0000
Message-ID: <bug-94757-8800-V9oOfU395N@http.bugs.freedesktop.org/>
References: <bug-94757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703521553=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94757-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1703521553==
Content-Type: multipart/alternative; boundary="14593495901.d21663.6308";
 charset="UTF-8"


--14593495901.d21663.6308
Date: Wed, 30 Mar 2016 14:53:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94757

--- Comment #4 from Mathieu Malaterre <mathieu.malaterre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Understood. I've reported that back to the Debian kernel team, let's see if we
can have 4K page back for PPC64:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#52

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14593495901.d21663.6308
Date: Wed, 30 Mar 2016 14:53:10 +0000
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
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757">bug 94757</a>
              from <span class="vcard"><a class="email" href="mailto:mathieu.malaterre&#64;gmail.com" title="Mathieu Malaterre &lt;mathieu.malaterre&#64;gmail.com&gt;"> <span class="fn">Mathieu Malaterre</span></a>
</span></b>
        <pre>Understood. I've reported that back to the Debian kernel team, let's see if we
can have 4K page back for PPC64:

<a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#52">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=790694#52</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14593495901.d21663.6308--

--===============1703521553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1703521553==--
