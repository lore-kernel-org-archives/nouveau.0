From: Ian Romanick <idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Subject: Re: Status of s3tc patent in respect to open-source
	drivers and workarounds
Date: Mon, 29 Mar 2010 11:05:50 -0700
Message-ID: <4BB0EBFE.6000800@freedesktop.org>
References: <4BAF41C0.5010201@warriorhut.org>		<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>		<4BB004EB.5080109@warriorhut.org>	<e7bd23c31003282134o32a5ec11ua6c7814fd5f3a7f5@mail.gmail.com>
	<4BB04245.8020202@warriorhut.org>
	<4BB04371.5020301@freedesktop.org>
	<4BB062C4.1030006@warriorhut.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BB062C4.1030006-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

SpliFF wrote:
> On 03/29/10 17:06, Ian Romanick wrote:
>> SpliFF wrote:
>>> So to clarify, you're saying a partial implementation (decoder only)
>>> isn't an option at all? If you expose an extension it must be complete?
>> See the documentation for glGetCompressedTexImage.
> 
> That does not appear to imply a run-time encoder. It seems to imply the
> data is already compressed - which could (and really should) be done
> prior to distribution (via the nvidia tools for example). The
> documentation does quite clearly state that the application should
> verify the texture really was compressed so you're only going to run
> into issues when the programmer made assumptions about the supported
> hardware. Not saying that's impossible, just that that's the
> programmers' responsibility, not the drivers.
> 
> Runtime compression is actually performed by glTexImage2D with its
> internalFormat set to a supported *_S3TC_* value, however the 2.1 spec says:
> 
> "If no corresponding internal format is available, or the GL can not
> compress that image for any reason, the internal format is instead
> replaced with a corresponding base internal format."

I hate to admit it, but I think you are correct.  Issue 10 in the
GL_ARB_texture_compression, the first two bullets in particular, seems
to support this.

(10) Should functionality be provided to allow applications to save
    compressed images to disk and reuse them in subsequent runs without
    programming to specific formats?  If so, how?

      RESOLVED:  Yes.  This can be done without knowledge of specific
      compression formats in the following manner:

        * Call TexImage with an uncompressed image and a generic
          compressed internal format.  The texture image will be
          compressed by the GL, if possible.

        * Call GetTexLevelParameteriv with a <value> of
          TEXTURE_COMPRESSED_ARB to determine if the GL was able to
          store the image in compressed form.

        * Call GetTexLevelParameteriv with a <value> of
          TEXTURE_INTERNAL_FORMAT to determine the specific compressed
          image format in which the image is stored.

        * Call GetTexLevelParameteriv with a <value> of
          TEXTURE_COMPRESSED_IMAGE_SIZE_ARB to determine the size (in
          ubytes) of the compressed image that will be returned by the
          GL.  Allocate a buffer of at least this size.

        * Call GetCompressedTexImageARB.  The GL will write the
          compressed texture image into the allocated buffer.

        * Save the returned compressed image to disk, along with the
          associated width, height, depth, border parameters and the
          returned values of TEXTURE_COMPRESSED_IMAGE_SIZE_ARB and
          TEXTURE_INTERNAL_FORMAT.

        * Load the compressed image and its parameters, and call
          CompressedTexImage_[123]DARB to use the compressed image.  The
          value of TEXTURE_INTERNAL_FORMAT should be used as
          <internalFormat> and the value of
          TEXTURE_COMPRESSED_IMAGE_SIZE_ARB should be used as
          <imageSize>.

      The saved images will be valid as long as they are used on a
      device supporting the returned <internalFormat> parameter.  If the
      saved images are used on a device that does not support the
      compressed internal format, an INVALID_ENUM error would be
      generated by the call to CompressedTexImage_[123]D because of the
      unknown format.

      Note also that to reliably determine if the GL will compress an
      image without actually compressing it, an application need only
      define a proxy texture image and query TEXTURE_COMPRESSED_ARB as
      above.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkuw6/wACgkQX1gOwKyEAw9cWQCfViC2igK2W7DvhtcDj8pXVd0F
wJsAoJ0q1Pgp1sy6HVy9H9ihg/ms9oVR
=OgUh
-----END PGP SIGNATURE-----
