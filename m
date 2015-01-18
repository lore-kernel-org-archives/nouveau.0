From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88515] After waking up from sleep nouveau fails with
	errors
Date: Sun, 18 Jan 2015 00:30:06 +0000
Message-ID: <bug-88515-8800-Pgpf2uKJa9@http.bugs.freedesktop.org/>
References: <bug-88515-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0582244950=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88515-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0582244950==
Content-Type: multipart/alternative; boundary="1421541006.E60e1.22893"; charset="UTF-8"


--1421541006.E60e1.22893
Date: Sun, 18 Jan 2015 00:30:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88515

--- Comment #2 from MiroJanosik <mirojano.sikgeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Okay, it seems to fix the problem! I have followed few steps described here to
update the kernel:
http://askubuntu.com/questions/119080/how-to-update-kernel-to-the-latest-mainline-version-without-any-distro-upgrade

So I did:
wget
http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb
wget
http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3_3.19.0-031900rc3.201501060135_all.deb
wget
http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-image-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb
sudo dpkg -i linux-*.deb
sudo update-grub

I made system sleep few times and OpenGl applications work afterwards (even as
complex as HalfLife 2).

I have a question now - will this fix get into Ubuntu 14.04 LTS? Bugfixes
should get into LTS, while it is supported, right?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421541006.E60e1.22893
Date: Sun, 18 Jan 2015 00:30:06 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - After waking up from sleep nouveau fails with errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88515#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - After waking up from sleep nouveau fails with errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88515">bug 88515</a>
              from <span class="vcard"><a class="email" href="mailto:mirojano.sikgeo&#64;gmail.com" title="MiroJanosik &lt;mirojano.sikgeo&#64;gmail.com&gt;"> <span class="fn">MiroJanosik</span></a>
</span></b>
        <pre>Okay, it seems to fix the problem! I have followed few steps described here to
update the kernel:
<a href="http://askubuntu.com/questions/119080/how-to-update-kernel-to-the-latest-mainline-version-without-any-distro-upgrade">http://askubuntu.com/questions/119080/how-to-update-kernel-to-the-latest-mainline-version-without-any-distro-upgrade</a>

So I did:
wget
<a href="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb">http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb</a>
wget
<a href="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3_3.19.0-031900rc3.201501060135_all.deb">http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-headers-3.19.0-031900rc3_3.19.0-031900rc3.201501060135_all.deb</a>
wget
<a href="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-image-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb">http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-rc3-vivid/linux-image-3.19.0-031900rc3-generic_3.19.0-031900rc3.201501060135_i386.deb</a>
sudo dpkg -i linux-*.deb
sudo update-grub

I made system sleep few times and OpenGl applications work afterwards (even as
complex as HalfLife 2).

I have a question now - will this fix get into Ubuntu 14.04 LTS? Bugfixes
should get into LTS, while it is supported, right?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421541006.E60e1.22893--

--===============0582244950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0582244950==--
