From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] [NVC0] Dota 2 under Wine freezes with Nouveau
	Drivers
Date: Tue, 26 Aug 2014 20:02:22 +0000
Message-ID: <bug-83079-8800-mz4kr2p5JE@http.bugs.freedesktop.org/>
References: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793168452=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83079-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0793168452==
Content-Type: multipart/alternative; boundary="1409083342.F1a173D20.32196"; charset="us-ascii"


--1409083342.F1a173D20.32196
Date: Tue, 26 Aug 2014 20:02:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

--- Comment #4 from Luke <lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
@Ilia Mirkin
I had a fresh, unused Kubuntu install on another partition, so I installed wine
from ppa:ubuntu-wine/ppa and used the default Mesa version of Mesa 10.1.3. Dota
2 froze at the same point, after I selected a hero. Steam also gives a 
err:seh:setup_exception_record stack overflow 2128 bytes in thread 00ce eip
7bc5e05a esp 46c40ae0 stack 0x46c40000-0x46c41000-0x46d40000 

Another way to trigger this bug is by previewing an item from your armory or
the store. Again this is with vanilla mesa with vanilla wine(no gallium-nine).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409083342.F1a173D20.32196
Date: Tue, 26 Aug 2014 20:02:22 +0000
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
   title="NEW --- - [NVC0] Dota 2 under Wine freezes with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] Dota 2 under Wine freezes with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">bug 83079</a>
              from <span class="vcard"><a class="email" href="mailto:lukebenes&#64;hotmail.com" title="Luke &lt;lukebenes&#64;hotmail.com&gt;"> <span class="fn">Luke</span></a>
</span></b>
        <pre>&#64;Ilia Mirkin
I had a fresh, unused Kubuntu install on another partition, so I installed wine
from ppa:ubuntu-wine/ppa and used the default Mesa version of Mesa 10.1.3. Dota
2 froze at the same point, after I selected a hero. Steam also gives a 
err:seh:setup_exception_record stack overflow 2128 bytes in thread 00ce eip
7bc5e05a esp 46c40ae0 stack 0x46c40000-0x46c41000-0x46d40000 

Another way to trigger this bug is by previewing an item from your armory or
the store. Again this is with vanilla mesa with vanilla wine(no gallium-nine).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409083342.F1a173D20.32196--

--===============0793168452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0793168452==--
