From: Andreas Radke <a.radke@arcor.de>
Subject: Re: Mesa 7.10.2 release
Date: Thu, 7 Apr 2011 14:06:33 +0200
Message-ID: <20110407140633.6a9c5cae@workstation64.home>
References: <4D9CD215.4000003@freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <4D9CD215.4000003@freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This bug breaks the build here for ArchLinux:
https://bugs.freedesktop.org/show_bug.cgi?id=35562

This commit seems to cause it though I couldn't find it in the gitweb
interface in the 7.10 branch:

http://cgit.freedesktop.org/mesa/mesa/commit/?id=5f0f9f0486e9cf43939dfbd1051298f05da1eec4

Any idea other than reverting it?

- -Andreas Radke
ArchLinux package maintainer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEARECAAYFAk2dqMkACgkQLju01StYJ8iDegCfUg7W1knO4LDOODlt5tDJGusH
r64AmOS/zWb3e8qmm5RRt4qQQuNZFZg=
=c1/P
-----END PGP SIGNATURE-----
